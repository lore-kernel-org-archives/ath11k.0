Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3626ACA0ED1
	for <ath11k@archiver.kernel.org>; Mon, 18 Aug 2025 06:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MnKk4TG4dpHWkY8CKQHt4rdBcdtenoFj0KzkwRYL+Vo=; b=f42bxmuUJDeEEo5xS39G0tamxT
	QaDYkbcByzZFmvRKE0Hk7pQdOfTdHEINWxLSksRta0xC6QojSGBw1QhMjaX7llT/n1/n3am9B9m0f
	2TG4LHiRntY+4KBmOs2OuzWxqgT6zcL2QwqgDuXKgYndXS++B4a8XMVcK6OboCeEIYDcqMS9No2E3
	9q5vD2SUIofOJCC3U7x70+CPT169ej9bomuSzRVNEhNwCb0ZkxIaHSBWpZEF29icolgW3I5K/K7fE
	idPwoWvHHyImfLrIJ5/xJUNMIwLhBx0fIahAkeaJexnD5K7gi0zZ4cG3oUYZHNFIuD/txu6+ebUbQ
	K2cXC7NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untaO-00000006gWR-1cEY;
	Mon, 18 Aug 2025 06:43:16 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untYr-00000006gFI-1z21
	for ath11k@lists.infradead.org;
	Mon, 18 Aug 2025 06:41:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMN9p17v8DKRkVqLuHpA3suiWubtiP0qAsaoefXwbEpmBO68cBmV0hPOk9WQVbLOKdzq1CEj+7IDz3XN3quLV5akXDEXmpeiN4tOyMjv8ZkAZSEB4fqVz4L2yMIh4s/1xlqQnsB7DT+3Q99r7qjPr6eS2dEs6SagANU69CI8lNUmT/uyUrydS/8AhPJlrelNQa1iFMhUC644IsDMpUHwztlYd7BSRF2z/36dVSqJE835oOqOVcmDyW/UiUfftDuxztJF8MgCjEyJfLJjr81uhjDKUD6F4iUkwc8F0qwiMQpafT/l7WjHkIRj1R3nF+190BUgAWHLthxSTsz67RvmNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnKk4TG4dpHWkY8CKQHt4rdBcdtenoFj0KzkwRYL+Vo=;
 b=TyoG22s++pfqrSCIz/qWDCBuoNK5LTQxZ0y0IKoqnIzfzSlCiDzQ1SIVwRLZN15O1dFj70aRoKv4X8OSx4WFL5Q0feYSy5Fkj6yivf4H7KoQc3QyqqpiHLZBpZnybkJgZsE3HA4VUPYNW7yihs6FvXVWP+uMRtBDuh6wyQNLjNYNiUGZuhy5XN/n0UbaAOAlwxlTTIY+38S+o/iciJ+rBIa6jICrOPmtKZw1LVgP/jnjTnSy29Yg2CS0sr/OGdVc8AqNwR5RHS56Kj2OZidW4INuWEJGAQV1LYuzmGZe/IQxl/JZRx7LbKnocOBdxvOOmhqH4g6O0vVwBP0keBiO5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnKk4TG4dpHWkY8CKQHt4rdBcdtenoFj0KzkwRYL+Vo=;
 b=nUYJ2rt//EYPbba2iOSlgBB9SMQpo/qEnoZt9wrmTAOnivrHh9x88fSK1KRW8/QJwDjO+62rL8T31fY+UESYhqcdtI5joOND+wBPrGKyRt1iyhlfAoU412XZDmCq3MoqAAcv8DkCq5lJ0Ujso7W0778F/MIvEFs4iCaGNWTfrXPupVifravyiwa92OVBKFfn+q100e2LZt3GOyX6lVxNL+/PJgrQc1NaSaWoW2ONVwHnl459biZ9Kb5s/NKk++Z01xhoPx4MNq25P//helVriSehdFXZrTlvjhPEEt7JLLvXfN3EF1zhCMf37/tgL7hclOy0BNJlxagdMGdppelB1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYSPR06MB7157.apcprd06.prod.outlook.com (2603:1096:405:8b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 06:41:31 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 06:41:31 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	linux-wireless@vger.kernel.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER),
	ath11k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] wifi: ath11k: Simplify unnecessary if-else conditions
Date: Mon, 18 Aug 2025 14:41:11 +0800
Message-Id: <20250818064111.447765-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:194::8) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYSPR06MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: 174db26d-89ab-4514-3b30-08ddde22442d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0ThWAj3TP4WlE4iJSGRgPgWvZWOwrugHpimnLcljMrbXNCPxZSqyj6t3frNn?=
 =?us-ascii?Q?4/V4ov5nZOTgUfvBn/C3WBcw2faaxBhLq8dBx9XD3lWFhgj3kBjhj7ElpBRB?=
 =?us-ascii?Q?HP2bcE/wHnfUzLe3tU6dHxO7Sqbudec/XNV1YNI7D62X4IE8NaIZAOgMFV0Q?=
 =?us-ascii?Q?OdsUr6GCmrDUzYmI0XEWcQP7FkLIQP5hiwMhX+LXzbO5/xF5js+EIpvYnwMu?=
 =?us-ascii?Q?n2UTRjYWG9EHPPn3On37AgnNDuyyllUKk7dUPQoIGojM9+2nF9nVFMD8iqVl?=
 =?us-ascii?Q?PzjBC4Y3/de7MsA3862rM4iN/30IyN44gQgfEZvT67qtpzML8HnAM1POtXOP?=
 =?us-ascii?Q?/4+xxehyYGGMrf89GQTPPavD9FjzS8xFgwXQ0GIBTqtJ0N7yLhIdcuiwxDSl?=
 =?us-ascii?Q?S0KHpnIv9o4RPMeeak66N1ZdGwiCB8P7V4MwVNnl9ygSOVwIImtOyjc1HQZi?=
 =?us-ascii?Q?kQJA+gXa2ZAbi8NecXC/SO68zsJV+VS8fegY8nBLxU8UW3RkmFHKUrd/BN36?=
 =?us-ascii?Q?psIxrWIk3CBU4YKel5AKFM8Z2UzdrKy4U8YiGilrUAKk9PCOYyo4mzjJ5x3k?=
 =?us-ascii?Q?BSGnszuz7SZvNZDrRB95fnlg0QJNlZiKedi3HQkdG6oMX2OCJS7CU0coDnzo?=
 =?us-ascii?Q?EfRrp3ImJ/UGv9WXfBpMgoqQw4ZwDB27y6UyRASyS9Od2GZH6hwc8aB5Ztpn?=
 =?us-ascii?Q?ojK/56bBhXvqKDpOnq1AVeUPOzFvRUl45YL9K1JGB7NJK1BLPOYsOSGWW57l?=
 =?us-ascii?Q?4YG23nqEqONjvnucy5SOJMtDZyvlmzj/Sc2BLlxDjK3q4W62YFjQZQDnMEdw?=
 =?us-ascii?Q?tnvllSIrT1z1+3s04A0D0+W4NL3vho3OuBd8RP8MxsAKEt5eFnjwiBKrUIN7?=
 =?us-ascii?Q?AoK4nvsT0S01HxcnGnTJaGslvDs5huqZRlzmsTQS0kHtH5B2fUpUjEQ9nLrp?=
 =?us-ascii?Q?U1TjVZ6VuKal3m5L/Rdw55LjX60GujymAg6KHcKH3tErRjn4xdGq2oOkz/U4?=
 =?us-ascii?Q?ZiHy6EvHStG6ziaxrezvK3cC1ZBegQZk4kBWBAj1+H3J0l5XfHWkgwFKPoKR?=
 =?us-ascii?Q?x9T73sR+UVhHFFxYQbPU1J4zRu4H/9R6PgeeRhEU1N/OFkmkpmhT9PYu9z//?=
 =?us-ascii?Q?yiwgPJI6QQfDyZE+M0wYUkG4lN1tw5QRQQoI9UHeAmE77gcGnvTcB6Y+lD2U?=
 =?us-ascii?Q?4SMDxxSP9Tgek2ub3Vkvp4xFV/PYerdSZ7jLtfjazAiPSFpBr0oIljoXMPOG?=
 =?us-ascii?Q?3YqMJoUVH2e+LKCZPMnvHNJdyNZ2YnEObQ+7nI5sfGZCBPxYQJ5iPXCJTjDz?=
 =?us-ascii?Q?W3IowIzmhMcOAcAxf9ymlAju77352qMCcsKg8UKPc5Wv3+OKsegyOwGJDXyi?=
 =?us-ascii?Q?xJniBHUU4h+3mpITLpn7auhjbyF9SfX/IAPUKdgHRcwa6bNC+EIb47pjWY+m?=
 =?us-ascii?Q?CR1THGNJBX+FjNgWZPMBmAWynPwV5ZoiBM4GVZzvtwyn3gtP/4BYJA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?23z3ajeFRogOFVjYXA/XEsxomA5fPJTxvkL//2hkUVbtqG8rkNCnqz9O/u+I?=
 =?us-ascii?Q?lkcvfcFxIYnZzn/E4UXg6kjpO4YcAoIWqa9EMIEFwmx2XnePQI4ilegj0Mm0?=
 =?us-ascii?Q?GUm8m7beA2hqd8CFtDcm2vzatwlhojiXCB8TYpuZsNwghoF2zwFlUDMul5DB?=
 =?us-ascii?Q?CR362lCFBCotobOkqZ3TuWLAywE9RuhIfFhPdKQSsLQwunheoAwcZQXwA7qg?=
 =?us-ascii?Q?+4mPU67p0TDtMDhh3980NcnwrqG3oZPSO0ZJ+1yKIRlOBTrC3yTGvMSjiOpj?=
 =?us-ascii?Q?vwwT7Nf57PBH3E/47+DBYH5bWcGnaadOe9lrbTYBG5DeQisZ6aYr8Pp0tZZY?=
 =?us-ascii?Q?IYuarXARNHAxZhorGzMEFzlkWsgXb2AIMNFFvTjqNSIZ5DyCzbIHUmetz48e?=
 =?us-ascii?Q?4MX0kIQQ9fl0wJeSBAyL2oqQPhrIzXIo8vyiOfS8KAEQFQoag8xoBcCufTme?=
 =?us-ascii?Q?OMOXdGFKflaBzUy82npDy5J/LZ5Ezs6L9dnGqvyuazOe/TvQZmPObypwSsoO?=
 =?us-ascii?Q?FasHq4At97SRMkVSXsAXW+20aPUFGW7ZgH39QS4RtIPUEj4rw6JqRZ4MuDCn?=
 =?us-ascii?Q?G6qB7Eh6+EZ83OGXaW0ncd7j8oQdHG/FFRKOUgM9M92AX8zc//6joujTxB8y?=
 =?us-ascii?Q?yfVkLMlsEAHiifEyVfIK9+3CLnXe9THjgC3VtQUW1QtyoIr1unv9dT1Rh6iT?=
 =?us-ascii?Q?SIV2Mu6hlbFmPg25CB4QHD66lOoHXS+mya4jZd9xIsYEI1Zw6DM0ra37CUzn?=
 =?us-ascii?Q?DbOLteQrIcpRUkpsPiB0lQKOXBo982Q23C0pZQBz0c4zi+s9f8TgwSVvbyBz?=
 =?us-ascii?Q?exv5mQ6skRAN3vkhSc2NfzyhGhjsui3VU5j1zkFIeJwxhJ01E09qzSSEoe4X?=
 =?us-ascii?Q?+YvfGVgfylIIWFostd5EaNjbgKbVo/OwQYcbWkfGOctta8nUI9pBbsnvS1hx?=
 =?us-ascii?Q?iUveymZrYI/jVLXSPMAlLPxCU0L6q+vKsF8sX/QP6EWKIAFsq0dRmIBqR4/1?=
 =?us-ascii?Q?BK9+yP53HdNF0iMHqPHAhB3Zo5/LTt83cZj2Zg2yR7Hif8KMVyhaRApW7o8m?=
 =?us-ascii?Q?0kGOdW2bk0rhotyaDypLFBtTmbAO3+j9rf2xIS8I5IeVBxeUSKl5N9v3H3by?=
 =?us-ascii?Q?M8nDs1Us+vyQGAxAAg+D/VFFahZ0qliG7s6H6erRJhQK/lSBle5m5rYL8F/s?=
 =?us-ascii?Q?HFypdOcO8pRx6iOwwS4rnTSecwQ/nNuPoyEIWRz+A/TaL8qV3SzLdpjEAioo?=
 =?us-ascii?Q?LXBeVSB0F/q5tORRnO3inq1DbcUjm3+Uq3ufhIENAQVXqZl2GL9VpQ6SbIkX?=
 =?us-ascii?Q?rmWMRc1dRoq98ar8HR/HadvG3U5DOqg3c+ZsssNvEUPOrfYi92neO/lX5tJc?=
 =?us-ascii?Q?565iY5rdwK0LzPMIxnbltO1LT9SZy9iwsnHmpUHWMsycbC6yHpoIoUcXxNh8?=
 =?us-ascii?Q?Fh5Ejk8QJae2vWJMaChsm5VajvRLMHm961wOHQDFwaqu8KfJ8dlWu8t9Y16m?=
 =?us-ascii?Q?M0BlSDYuC8w30yJBKGjHcz/BHI9+OxUbwZf6O9VABXd10nXJyANV5RPIz4XG?=
 =?us-ascii?Q?z+86aNo+f6XDfPr66P56iqAksylhnrd80ucdLsK+?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 174db26d-89ab-4514-3b30-08ddde22442d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 06:41:31.3184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kHemvCyELOCpIACmXSMKv+ynbFILElaiPhMQ4OEFknmZitxDGq/MPQHpFVaVSWEhuXK8i+f4Bl9dr4OgLreiOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_234141_512468_8AF6E428 
X-CRM114-Status: UNSURE (   6.79  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Some simple if-else logic can be simplified using the ! operator to improve
code readability.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1fadf5faafb8..328df27116ce 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7936,10 +7936,8 @@ static void ath11k_mac_parse_tx_pwr_env(struct ath11k *ar,
 			    "no transmit power envelope match client power type %d\n",
 			    client_type);
 		return;
-	} else if (!reg_tpe_count) {
-		use_local_tpe = true;
 	} else {
-		use_local_tpe = false;
+		use_local_tpe = !reg_tpe_count;
 	}
 
 	if (use_local_tpe) {
-- 
2.34.1


