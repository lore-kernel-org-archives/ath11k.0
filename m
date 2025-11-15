Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA23CEBF87
	for <ath11k@archiver.kernel.org>; Sat, 15 Nov 2025 23:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uAlfIuyHtUG2VFSg/GnjvjwZIDvObJnQ+nW2LNtDc0s=; b=oZiAyuKxOh8G29sd2Wh0ZwVeLj
	jODv2pjGEXzuiupjPK/xTboq5AAhQ9a9GYOXzpdpig0dz1lSt/glPjsIzpS+Z4veLSyvGmtKN1mcB
	6ZuBfRjoFQDZd61Y17/nQ/jgiGGsK2cLkv7lLaImE9wOGoQvkHit8H5JSpZEAu8igbMTHSuGKNkWw
	MmxHw6BecvogsxIN+LazDwA8Pin8BJ7JhSAz1uf9zY0g8Y6B7t1sHDHqD/gFyXvSenkTdTo0Zga8D
	nttFdcfraikUr0TutulGKpnE37qOymjMJHQHfa89h8AOHu7jD/JZv13dMy60kqDt1nbcI2wtJ2Rlm
	hIDXYR6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKPQH-0000000EBKY-059g;
	Sat, 15 Nov 2025 23:11:13 +0000
Received: from mail-swedencentralazolkn19013076.outbound.protection.outlook.com ([52.103.35.76] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKPQF-0000000EBK2-1k5I
	for ath11k@lists.infradead.org;
	Sat, 15 Nov 2025 23:11:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VSoOIDTaYO01bwsap13AqHLzaPPzP896HlOhzHcmYS6S4NTTxWsYc2MrGDGtlVVnKfXtkeRINLJ+6353CJIqig9sW6IatIeU++jGL3WMW/mZ6lAoRqq5RMWjX4Dor+Xetet84klp2yFtNyiVDVxrCaX1C9v6jlK40U8Uwz0wqlsNJHbJNw5+FMmFJqup+/ecGyLS3rY3T/siELCQBQzSwUTTQ9ZPdOnqb84HkAm8i3sc+0S/IPAf5jlILBtouWosf5PPMyURrhTrZ0i6MVZKzJmLDM+nWZKOTIZt8BPf8WaYj4TpxjuQe/DnhEP/nnxvbx09/U1Jo2TO3GDSc3xEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAlfIuyHtUG2VFSg/GnjvjwZIDvObJnQ+nW2LNtDc0s=;
 b=hTkcV7ufpGiq0ObvTMWEI57pCXVmmuuLG4HMrD/f/bfneJJnEJ50IhzEgTL/YMVM7t2bTmPWduJVn3M/soXIGSXTvsvYdqVeWgSdooC3iXVbRWLyOm9LGXE4G6Jy+2ATGjBke3aS1/4wgu3OVA7MYtTzU8ywOZCORjoQVFGt7vPkEHgvb5rVTQZPk5LREhRBsV7NOJ6WommkFhaIGhqWTJp5oA2m6ZMrgWCLSpKOeySnmpibzuhB/DYMfRDg1HWdgWdMJfsVJ+CrTFyoPAuDo/TEvX7+MkzE9oblTsf+PY47DotQ7Oc65/JVFiuyDGlHUxY8WR1BbrJKptRUI1LxvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from GV1P250MB1433.EURP250.PROD.OUTLOOK.COM (2603:10a6:150:284::10)
 by AS8P250MB0299.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:37e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Sat, 15 Nov
 2025 23:11:04 +0000
Received: from GV1P250MB1433.EURP250.PROD.OUTLOOK.COM
 ([fe80::5957:21ce:d025:7747]) by GV1P250MB1433.EURP250.PROD.OUTLOOK.COM
 ([fe80::5957:21ce:d025:7747%4]) with mapi id 15.20.9320.018; Sat, 15 Nov 2025
 23:11:04 +0000
Message-ID: <GV1P250MB1433E723AF90A69AEBB696DAE8CBA@GV1P250MB1433.EURP250.PROD.OUTLOOK.COM>
Subject: [PATCH v3] ath11k: add ath11k_mac_op_flush_sta to properly flush
 pending packets
From: Florian Maurer <f.maurer@outlook.de>
To: ath11k@lists.infradead.org, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, flole@flole.de, 
	benjamin@sipsolutions.net, Sebastian Gottschall <s.gottschall@dd-wrt.com>
Date: Sun, 16 Nov 2025 00:11:03 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
X-ClientProxiedBy: AM0PR06CA0135.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::40) To GV1P250MB1433.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:150:284::10)
X-Microsoft-Original-Message-ID: <f9b5a9b8630e3712a77d1440e2b2ae212c477984.camel@outlook.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1P250MB1433:EE_|AS8P250MB0299:EE_
X-MS-Office365-Filtering-Correlation-Id: d5fba273-aea0-403f-c5db-08de249c3ff1
X-Microsoft-Antispam: BCL:0;ARA:14566002|51005399006|6090799003|461199028|5072599009|5062599005|15080799012|19110799012|8060799015|23021999003|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0hBVDU0VEw2dllFblJmL00vRzVqb3ZCUlArR3RkQzZDSUtCWDVEOUs3UWlz?=
 =?utf-8?B?dGo0WnNaYS9sNERUdEtxSE9iV0owbkVLZFVsbCtvek5lajU4RHZjYTVUYTRX?=
 =?utf-8?B?YW1jcW5xUTBXbEVGeWgrVHFQdllrT2xXK0o3YnZodS9LWUM1TlB2K3pEb2FM?=
 =?utf-8?B?eUorcWVOUVltUzhnNzN2R0FVN2VETnY0NFNyTFo3ODVvd1FtbllDS2pUeEYx?=
 =?utf-8?B?bjFtVHcrbEZ1aWQ3NTRSM2ZKK2VOVnhHYzJmR0NyMHhjTGcvTXpJOURMMDVh?=
 =?utf-8?B?RkVlczZFNnZtNjB4MmVod1VVclI0M1B2N2hONi9wYU5TZzVrOUJYVzNrbTc2?=
 =?utf-8?B?QlFxSHpJWnpBUHdaY0FKQ3VFa2gwVi95amhzcFRpdDdWQjhwbm5VK1oyS2Nh?=
 =?utf-8?B?MEpzUXhsWU1CanZIVmZRY1RSdU5JQ0xNSTBBSGhXbGs0ZGJldzJLWmUxbHVw?=
 =?utf-8?B?ZnIyNnEzdGVldXRnVm90V1FCeldCWlhqUTRZeURCQVlUY1M3a0RSb3FwRnNx?=
 =?utf-8?B?dkhPM3BBTlBlZCtyUzFFako1SVlyUmJ6ckJkLzhuMllkQlNhbEZwV0dKMlNk?=
 =?utf-8?B?U04wcW4yam1EMnFHS0NEcTRpQ2NWWGh5WmtkbXFIN3lndFk2S0twelQwdUVx?=
 =?utf-8?B?RDN4S00rbjlWcUZqb0hMNUxjQ0VBNVpUdjlmQ3FRQmdyQngrbGZBbVZxampB?=
 =?utf-8?B?eG10ZlNxNTNNaTkxYlFVRTRQNGduSWR2T2Y4NHV5d0wvanJzSC9iSi9SWHBs?=
 =?utf-8?B?S0Rwdmd2QzlXSWRKeUp0QXViWUlMbHEyVUt6dlhlV1YvZWxCbzVjSVQ5Vm96?=
 =?utf-8?B?VUt3OFNRUHZQVUVhcEdSZXZET3FHbFl1U093c1JZQXpBbkJZcXU0cS84Q2lU?=
 =?utf-8?B?QjNSQnZMVmYxSEZYSURiYUxnWFlYRzZscVE0RmpqcCtySEhja3RraFZwckRm?=
 =?utf-8?B?Q2crNmV4VzdGZWErOVlOdVd4MEJOVnd3WkNQbEZDNVphc3gwN1JTbGp2ZmdY?=
 =?utf-8?B?UzdBRC9oU3FyZU5NbFM1K2lBekplVXlzaDdlOFlrYTYwTHZGUjduWjZ6MVhT?=
 =?utf-8?B?am5qanYvY3ZjaHFxeDlmbWZSS21BM0RZaWVVQ3JZK2VWUkc3c0RJL0NiWmEy?=
 =?utf-8?B?ZGwwU3VrVEZoVkcrek12TzBzcExGMDVsM2NmRWdMdDcyQWdNSzQ4aVd5QjNW?=
 =?utf-8?B?WUVLa3dlbkpuU1VzWVRtZ2ppOFJKR053VnFpa29LMEZlSXR3a3NBelZLVjI2?=
 =?utf-8?B?SUxvbE5LQXNoQjlqVCtueHRDMTN5RWdvK3VNdTBQUUJoMmRsaTIwK0ZCOHM0?=
 =?utf-8?B?UjVSUERDOStNbDhmME1MTk1ndmEyNE9lWFQvQnBaOGpLdGhINVM0dFFVUisr?=
 =?utf-8?B?QTJaVXVhNTYvU0lVVWcwU0hCN0VJUjQrNkFFaEdldlFVVElycWtMZ1VBMURy?=
 =?utf-8?B?b2pFVDFqOFRXUGMxc2tnU21tL1lVbW5FN3g2dHNPY25KT1Q0czZZVGNTY1dz?=
 =?utf-8?B?RkZSMXA0VUV5anIyUEJ0VDdieWFMVkRJZVNLcVI0TVBQNGJTK1BkaDJKRkto?=
 =?utf-8?B?MEZablVQVEhqY0x2Vy9oa2VTTC9JNDhjNGdiak0xbVFCcWpTMXRHdWRoM3Qw?=
 =?utf-8?Q?BBmkG3ehzP0hvVpzj7DeRaOMuo0WlOSq/RKA6GlyR6MY=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T09TSC9zVVN1NjZRVEtSZm04UlUyTGtFRjRzaEs2L2J4V2Nsc3RqVFJ5VzJ5?=
 =?utf-8?B?NEIzOExjZmw3QlNRTUNaMjRGMVlBbHk1L0FKYXlqdldIa09wamNYQ2RBRTNw?=
 =?utf-8?B?enRKaFZsdVViTlQ3c3BLdHRqcU1Zbm1INVBuRTV5dnNaMmZzSzd5UWR0NDBl?=
 =?utf-8?B?Yk1iOW9ZbS83bndiYXVmWG8xaUVuRGs5WEFwZVN2THFKN2lid0FveVVudkVw?=
 =?utf-8?B?Yng3NHRpeFN1SkM0Yk4rRGl6ZjlkMmN3T2hKUjBhNTZ3dWRNbFEvV0JaWjVH?=
 =?utf-8?B?djNEdlp5NmdTS1VDUUswT2tOQU0rU0gvMkRSblROQ2dsVjg5VFkxaDFBVlNN?=
 =?utf-8?B?c2lLcExqZFBIeldEWGVPVE9FaW4xWnBYU2hBdWFqSWduZ1ZQdy9GYkhtQ0g0?=
 =?utf-8?B?VEdWVlQ0OVBydGhXaUFicWthREF1d1RVTXNPMTJ6emF3cWZvVlEweVVuODdB?=
 =?utf-8?B?V0pTQXJaeXRueThzUmRRYW9ReGNzV2VPbnNWWU82SEYraWRlQ3ZtQmIrUHhj?=
 =?utf-8?B?bldSdkRQcFJxRlBPOGFabzMvUWt3ZndWcHNzZk54N043ODM3azFzRGFOSFJY?=
 =?utf-8?B?UGxubDN2TXFVa2tZak16VFlMYnd1dFhZTytmZGo3dDJVWFgydENzT3NUZnZs?=
 =?utf-8?B?bkdpSWJzYkpFMldjcytMUXVReU5rSUtVZEF4OWJNc2VFS0E1ZU5taktaNEdT?=
 =?utf-8?B?UXRhZVpPQ3NhNG5GSE1SbHZPYkRBazJ5eTg3UlVzRWdTY3k1cXRmTTNyWWwz?=
 =?utf-8?B?SWR6NjF3NFMzMU43L0hvSGx3c2lMSUNtbjRsSzA1VWNHY21oRVBqQnJoeDJR?=
 =?utf-8?B?S3hka2RqQUdNZFo3UXlUV1VaZDB1VlhVRlhEaHFGRTZsakZEU0NTZGI1ZDNv?=
 =?utf-8?B?elliNkxnaVVPclVZVStGTXNvcEZMRS9ZcHZ0a3VzZXdnaTNsam91VFcwRlMx?=
 =?utf-8?B?OElSenBZRE9jYi95cHVydjNGUktGOGNnTm1uT1hMWCtwN2hxUGVCa0RWbW1X?=
 =?utf-8?B?QnJmSGwyYVc4SnJsZUpNbUcwZTRVek9ZNlFNcU5ra3gzcnFYM0V3Y3lwTFFk?=
 =?utf-8?B?bkhrckVRaEgyeHFRdWsvNU1PR2Qyak4rUzR2MGkwNjgxMmVTN2EwZGFaNFlD?=
 =?utf-8?B?WVUyUjBmamhITE02V3d4NXp3K2VXQmtEOGY1Rzg3SGxUZGlBNlZkM3Fac0Uv?=
 =?utf-8?B?YXlEejEzMHVyT0x4RGhaazhxa0FZYXBUNFk2SG5hdGpjakRYUmo0QW9JME1p?=
 =?utf-8?B?V3JiMUQrb0RCd2hXdXpzZjhmckZRSDAyQ0pSMHRVeGpmTEFOV1RnbXlVeTBu?=
 =?utf-8?B?c3htWWs2MnN6ZEVDWGN4Z01HT3VNdDI4T2MvaDFOOXp3eEdDNnJnMDB0SFNv?=
 =?utf-8?B?Z1hTdGlpR3gwWVE5dEpZdVBCUmpONzRxd1NPbEp1cll2MkRWM01LeDlVL3Ix?=
 =?utf-8?B?cUI0UHZjaWJVSnZGWnFoeXFWVnZBRmtXbDMyTWJMTUl1WU4zYVNsNzNHYjVU?=
 =?utf-8?B?enhDYWhFT1A1TjdIcXZ2WmMrWTBaSEVjRCtGVWpIYzlBWHpaL2w1eHVMWDFN?=
 =?utf-8?B?c3FXQXNvYWNCRGpDbGhCUEs1cTRhSlZnSC9vTEtBdm5CQkcwR3I4cHluM2RY?=
 =?utf-8?B?YWlCUld2Y1pmYy9ySWRuaUR0UmJTMzdHdFJCV0JBRWhZdVpVSmVON2FNbldN?=
 =?utf-8?B?dzdrN09DQmh5QnlNMlRXQXlabzI5eWxtekhjNURFWWRZd3dCOGU4cXBoQjhN?=
 =?utf-8?Q?JjgZJIZwwJt0Ed3pWs=3D?=
X-OriginatorOrg: sct-15-20-8534-15-msonline-outlook-5f066.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d5fba273-aea0-403f-c5db-08de249c3ff1
X-MS-Exchange-CrossTenant-AuthSource: GV1P250MB1433.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 23:11:04.5869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P250MB0299
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_151111_479918_7F71E53F 
X-CRM114-Status: GOOD (  12.10  )
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

When a STA is marked as no longer authorized, if the driver doesn't
implement flush_sta(), mac80211 calls ieee80211_flush_queues() to
flush hardware queues to avoid sending unencrypted frames.

This has became a problem for ath11k because ieee80211_flush_queues()
will stop all traffic and call ath11k_flush, which waits until the
whole HW queue is empty. In a busy environment this will trigger a
timeout warning and stalls other STAs.

Fix this by implementing flush_sta method using WMI command to flush
frames of a specific STA.
Flushed frames will be marked as discard in tx complete indication.

warning print "ath11k c000000.wifi: failed to flush transmit queue 0"
was observed on various openwrt devices, and is fixed through this patch.

Tested-by: Florian Maurer  <f.maurer@outlook.de>
Tested-by: Flole <flole@flole.de>
Co-developed-by: Benjamin Berg <benjamin@sipsolutions.net>
Signed-off-by: Benjamin Berg <benjamin@sipsolutions.net>
Signed-off-by: Florian Maurer <f.maurer@outlook.de>
---
We tested this patch and it solved the problem of flushing the transmit
queues taking too long when the AP is busy.
Setting more than 0xFF leads to firmware crashes in AP/MESH mode.
Setting bit 17 in AP mode crashes as well.

There is reason to believe that bits 25-28 should be flushed
in STA mode, which is tested with openwrt as well.
This should make sure that no unencrypted frames are sent out on
station removal.

Regards
Florian

 drivers/net/wireless/ath/ath11k/mac.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/a=
th/ath11k/mac.c
index 3276fe443502..69010d3c6b95 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8640,6 +8640,26 @@ static void ath11k_mac_op_flush(struct ieee80211_hw =
*hw, struct ieee80211_vif *v
 	ath11k_mac_flush_tx_complete(ar);
 }
=20
+static void ath11k_mac_op_flush_sta(struct ieee80211_hw *hw,
+				    struct ieee80211_vif *vif,
+				    struct ieee80211_sta *sta)
+{
+	struct ath11k_vif *arvif =3D (void *)vif->drv_priv;
+	struct ath11k *ar =3D hw->priv;
+	struct peer_flush_params params =3D {
+		.peer_tid_bitmap =3D 0xFF,
+		.vdev_id =3D arvif->vdev_id,
+	};
+	int ret;
+
+	if (vif->type =3D=3D NL80211_IFTYPE_STATION)
+		params.peer_tid_bitmap |=3D 0x1e000000;
+
+	ret =3D ath11k_wmi_send_peer_flush_tids_cmd(ar, sta->addr, &params);
+	if (ret)
+		ath11k_warn(ar->ab, "failed to flush sta %pM: %d\n", sta->addr, ret);
+}
+
 static bool
 ath11k_mac_has_single_legacy_rate(struct ath11k *ar,
 				  enum nl80211_band band,
@@ -10095,6 +10115,7 @@ static const struct ieee80211_ops ath11k_ops =3D {
 	.set_bitrate_mask		=3D ath11k_mac_op_set_bitrate_mask,
 	.get_survey			=3D ath11k_mac_op_get_survey,
 	.flush				=3D ath11k_mac_op_flush,
+	.flush_sta			=3D ath11k_mac_op_flush_sta,
 	.sta_statistics			=3D ath11k_mac_op_sta_statistics,
 	CFG80211_TESTMODE_CMD(ath11k_tm_cmd)
=20

