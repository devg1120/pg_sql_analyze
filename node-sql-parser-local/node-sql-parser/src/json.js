import { exprToSQL } from './expr'
import { toUpper } from './util'

function jsonExprToSQL(expr) {
  const { keyword, expr_list: exprList } = expr
  const result = [toUpper(keyword), exprList.map(exprItem => exprToSQL(exprItem)).join(', ')].join(' ')
  return result
}

function jsonVisitorExprToSQL(stmt) {
  const { symbol, expr } = stmt
  return [symbol, exprToSQL(expr)].join('')
}

export {
  jsonExprToSQL,
  jsonVisitorExprToSQL,
}
