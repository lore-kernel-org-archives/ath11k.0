Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F11CCFA13
	for <ath11k@archiver.kernel.org>; Fri,  7 Nov 2025 01:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SxLtGE9hNY8AGX1gcVJugdhXQueeIaCEjnt4ltwTL8o=; b=eEpI6iaVCDh/EjwKTRI9pXmw0Y
	0HK2tOhozHyu2w4hl/HgXXsEZuDCdPQZUzzU1yOW2BRnTvdecZWqvrgD1RlJQJyOKpPO3EDtKE//d
	TpLjuXkZjeCFSlKFZ21NKRXyUC2g6Fo+YUioj8C242q5hBfiJ0HEXBqlDSg9OGsDh9NBCOSMR2j9O
	+/TXuVQpUjn417qALdgDTI+fCeL1/a1E16/JZCJeTutsufQvGtK4gi/6Gl2LigMxQGOskzEirNmv1
	wzSKkyaKhTvo+Vu0BvcJSFOIJvmPfIXTAQutRgt4kIjYFpSlMlqaGt2ULTglF2Emi/CSt9+4swE9+
	K8ZX2ilw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHBHH-0000000GVWM-3T85;
	Fri, 07 Nov 2025 01:28:35 +0000
Received: from mail-francecentralazolkn19013086.outbound.protection.outlook.com ([52.103.46.86] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHBHF-0000000GVVo-2guJ
	for ath11k@lists.infradead.org;
	Fri, 07 Nov 2025 01:28:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqtuvEruJrQ4lg6OTMwHsYU5IuI0voX9YJ3+erjHjcf1hHDzBxXY1pMyQihb00iE7a5kwAWK0tmllB1C00xHVvdfDi+cSLW5iD5eZDNVvWg7N4ZD2kYyDDnE29EKeCNlKu0wNylLPBea9sUxqNvrNcF0OidBH/He6qgc9Bbt+1TwCCWfKvs6wgGtTqKH3+yhQbdYb70pW3vYULuSqgikJLDGzqCyiTkyUwkg0tjxpJ0ys0nEFFnCtu0XfXqlBBpgLngWiinNe9sdDopsgJtUbm5+mQWcRK114BOs6xGRj6U4KTD/TzT5UrcpeDsUoe0emSIHV6cw3VrQ8PJycxiMIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxLtGE9hNY8AGX1gcVJugdhXQueeIaCEjnt4ltwTL8o=;
 b=rE5OolxDVF8u7X2L/bGlxuIMyLeWpTcapSk8mE0v5FWGipOaqyxeA9GChfQgMJYbjNuV0KNn59lIvBGCaynlq71C/UtDF9NoJHBNGwOIGxm/YGd7HxFw22dHMlrzTUr6eiXHwuL4OzgLIh3QfQEYMW7pOSZYwgfb4ge7vYQLghXK5lb1UAG1B1SJ0BCTeGX5Sl1GTUhnnmPMpiY91/8mhR0Wtdaj/9Fc7wUKuIMJwtSgI87bpKSk6LqGWiL1a2SyWLOQAiRA3wYzC/N4vFpbREEIpU0oL3dk4BA4Lma1Br1z1dg0/DTHUmN7HEWziolclCTWE5LV+PqccsxX/JDD9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from GV1P250MB1433.EURP250.PROD.OUTLOOK.COM (2603:10a6:150:284::10)
 by DU2P250MB0272.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:27d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Fri, 7 Nov
 2025 01:28:28 +0000
Received: from GV1P250MB1433.EURP250.PROD.OUTLOOK.COM
 ([fe80::5957:21ce:d025:7747]) by GV1P250MB1433.EURP250.PROD.OUTLOOK.COM
 ([fe80::5957:21ce:d025:7747%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 01:28:28 +0000
Message-ID: <GV1P250MB1433DCA1C5D24F805A82A387E8C3A@GV1P250MB1433.EURP250.PROD.OUTLOOK.COM>
Subject: [PATCH v2] ath11k: add ath11k_mac_op_flush_sta to properly flush
 pending packets
From: Florian Maurer <f.maurer@outlook.de>
To: ath11k@lists.infradead.org, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, 
	benjamin@sipsolutions.net, flole@flole.de
Date: Fri, 07 Nov 2025 02:28:19 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
X-ClientProxiedBy: FR4P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::14) To GV1P250MB1433.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:150:284::10)
X-Microsoft-Original-Message-ID: <ad9241c7aa85516026c7b076da56b26732a212e7.camel@outlook.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1P250MB1433:EE_|DU2P250MB0272:EE_
X-MS-Office365-Filtering-Correlation-Id: cc0a9623-39d5-4f38-d915-08de1d9cf201
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799012|8060799015|8022599003|5072599009|23021999003|15080799012|6090799003|12121999013|5062599005|461199028|1602099012|3412199025|4302099013|440099028|10035399007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzRUd3lJbDdETWhpMlBMN1lYQ0xTWmlvYlQrRTd4cjNoak1PZDBaSFYrREJU?=
 =?utf-8?B?Qk03c3V3TE5EMEh2VGVlUk1rUXZwZTBTTE9EWjNQVGc0cFVzY21vaVhhUHR3?=
 =?utf-8?B?K3JXeGQ3b3RXbks2TDdhWEZ1aS9haDh4MEtiZUtYYXdhVFNoSm5KZHpXTnRs?=
 =?utf-8?B?T0s3dy9IQTlTN2VDS3VkMVJrQ0lGenQ5cjJJRW1rTlRRajFyYnpWK2IzOVlG?=
 =?utf-8?B?UGkxK21Jb3I5bGphMml1dkNKOWczb3I2Z1RQYzBEMXA4ZWJ4Mk9TZjlHY25r?=
 =?utf-8?B?ekozYTB4aTh0MEw4RGZXVlROb09vclZUT0ZlOEJQZGJ6SmYzVFY1VlhjbU9k?=
 =?utf-8?B?SHoyQmgwVm1Qek9vQVdyQUVJWk02TXArL1V0bHpSeDVFcEVLSUU1ekVxaFhH?=
 =?utf-8?B?Sml6R20yc21xMU4yd3N1Z2dRRm9IUDV4UjU3b0xCR3hMVER5aTkycFQrQnFo?=
 =?utf-8?B?MUNhRTc3Rkw2eURpMlFpQitWTnQ5U0E5OXMvM3gwdmliSW1EbU1ld2dGeVhj?=
 =?utf-8?B?MFViMUx4REdxdjJjQ0JQamlqdUdKM2Z0NlgvNXVML0ZLbWROQUxCUGVXT2tW?=
 =?utf-8?B?SlNoK1dicnpJdXJybnF0c2lFeUZHSlRlNHVJVzRUK1g1bEdzVDhYUUFyeWt4?=
 =?utf-8?B?RUdITEFmVEdSZGo2TzJwZVpoZEQ3RG1EampTajJHWWJNVkFqZ2xFOE1OME9r?=
 =?utf-8?B?MzF4M25ZRXI1VlVjN2VOWkhzYmNNbkhRUTAxdFM2bVI3RnduR0pqeHJYUElZ?=
 =?utf-8?B?b1N2VHJUdXBMd1NtOFc5bDhIVWVldnRpQldtWFQrQzlhTUhzQ0p3a0pDN1kz?=
 =?utf-8?B?dlorQUd5Q2NEd1pDbldlRXlkU1loM0UzS1BHdDNqbG15bUl0U05UVWkxeGFZ?=
 =?utf-8?B?SDNEL2RIMU0vOTFQOU16YXEyK2tJUTg0WjJrM0FvQ0Y2NmcydWZEVWhjZlhj?=
 =?utf-8?B?dlNDUDFwZmJob1BqSE5iSGh4by9xajdJdkRNRVZ5cVNWY0VpYVY0SDNuRDJC?=
 =?utf-8?B?ODZXd254R1l5SlAwZkhRMlh6MUUwL1I5RGdETEZ3Rml3Z2VqWkE0M2ZzUmRk?=
 =?utf-8?B?L3VZckVvQVJSRVU0d0REU1NYR2FWK251VUlUMkVQYzk1SWFEUVBCZ1doMEx6?=
 =?utf-8?B?czRpOXROMkEzNmRZOWd6eGNVNThpNkZmNzloT2h4aVZtWEpQWHIyek5LTmNt?=
 =?utf-8?B?N1VxREdaVzM5MjVyV21ieThncFVhY1hDSHk2VU5LNmp0MWxUR1F4OVMyeENj?=
 =?utf-8?B?TFNwUFR1RVdIMHc5ZXJndVowVWJ2UURtTGhjVWRFbE1NdGNQbE9aWEtvMXlV?=
 =?utf-8?B?aHBZMENrNjBwQ1NzejdBTlpJUE4xRzZ1Q3JKWTFqVlp6NGtYbVBaVEljR0hQ?=
 =?utf-8?B?R2hrWDdyWUxWbDB6YWdmdUlSUk5IUzR6TWViVitRRmpVVitHc0ZGdlA0ekpN?=
 =?utf-8?B?TGppeGY2NmtqUktqUGUwdmdjNzRhY2Z2ZmpaSkkreUsrMXhjdTRNQkhxK3Ra?=
 =?utf-8?B?MXo2bi84M2RpL1J5bHpHcjdDMTFTemN0ZjdkcVl6NlIxRmEyYiswYkZjMlNX?=
 =?utf-8?B?dkdOY081WldTUkR3Vmg0S1B4aWJEbjlwMm5Bb1hXMjJydk9YTUxuYUtEVUNE?=
 =?utf-8?B?UCs5Yld6RWxIMnM2ZmdqMmJpWWliUWJPeG5zdXUzUm45VDlTQnNrYmZLUVA3?=
 =?utf-8?B?NWlnWlg3Z2NKZHp4SzJnM0V6YXh3VVVCdDJJZXFnVlRpS0N5WWFjbXA3V0d5?=
 =?utf-8?B?L0oraGRHOG5GK0ExcjByTXBBY3JzVElVWVFuRS9TQU9jMEF4RXp3QUVDWisw?=
 =?utf-8?Q?8x/KJvO3tbtBjkPo5vTS67p1n9tYHnbHt2kzI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDIrakw3VnRNeHhCbmlqVjgvQ0lFMExmT2hrNlhIK0taQnF0Um9RNEJha0RQ?=
 =?utf-8?B?QlAzUysrNmpwaGRZVmxaTy9YVG5yNjNmNmJnVnFxOG9KYWlTTllCZDZqdmJN?=
 =?utf-8?B?cWlrUW9NekEzWENlWUU5ZHpwQlhGQXJyQmpIcWdUTGhTSW9mS2xqVnJBb1ox?=
 =?utf-8?B?VmRQeDJoclN1RHg1SzY5Yjh3cGlpQ01VNkdZVlkvU2FRYUUzK2tzekhRVm9w?=
 =?utf-8?B?Um8wMzR3SlROMk43b2k4OXRFVk9XSTEyNTRDVzV5QnllMG9DVTh0KzZDSTlz?=
 =?utf-8?B?cldYWUE3ckJ2Sm5LZ2d3STVaNlViSnVFaTVRUFZmSDB2a3JkdDRoblR1U3kv?=
 =?utf-8?B?NUVKQUZ4OURGT3V4VXkyQTJ5eGc0Szc3NkMvS2NjU1hRb05vK0owMmlkeEts?=
 =?utf-8?B?aXZxNThrYjFyMFc2aS82cDRZRndDNFplS2phT054L0tpTGdVQzNGb3Y4cUJZ?=
 =?utf-8?B?Ti9Zcm5LSlZ2cTRyYU52SWV1SW1UT0lWRmZqYnhWZ3Zlc2dNZWpjaCtIWHgw?=
 =?utf-8?B?SzMxelFlODMvQ1RBb2JHV0p3a25aa0RZMFNrMHE2c3lhKzFGU0Z2bDZ5T1lK?=
 =?utf-8?B?ZlZjZnk0eWNxZmszdTNPSWJPTjYzM2IxdXM0elYybUMyOGRaOElzSDJvV2Nl?=
 =?utf-8?B?NjNyZndSdDR3b3dFVC9Jb0lIdU9YNVRzaCtsSVBOSmZCZkJ0dXlqN0FkNVVI?=
 =?utf-8?B?L0Zmb0swb09KdFM4UjYvSk1yM1N5UzYwQWNacmRUZWxHNTM5aXVDeTV2UHhY?=
 =?utf-8?B?dXJNVHFVNndWTWx0eEU1ZUhJUmVSTUVjTVRleXhQSXJRNHRwckhXNWVQekIx?=
 =?utf-8?B?bHhTOEdEVHJqUVpRTDlvMWh3c1c5emJ3TXoxSGFjZERJK1dFQkd5YklVWHVi?=
 =?utf-8?B?NFhnVHE4Q295RENvcGg4MW8waG9SeWdVV0NoTm1CNTI4MWYwKzdRbm03VXNz?=
 =?utf-8?B?RDNPU0tyUG9INlNrbDNIdCtsUDJkNWc4cVIzcmZNWDFHQWJqZHRuVmxhTWo5?=
 =?utf-8?B?QWtsTEcxMlNMeEQxOUhYekR6MkYrRkVqb3VQek9ycVBud2N1WmlBcXBCSHFW?=
 =?utf-8?B?RUpRMFE5c1c3ZHM4M3FlenBwTDBRV0JOMy9xNUIvK2ZxUmV2cGY2Z1FqTVpL?=
 =?utf-8?B?a25ZTXR4TTA0QXZVbXR1UndSbGlwaFY2TmZEbkRESFJuOHM0NWloNWxhRm5l?=
 =?utf-8?B?ejAwZDZGdE9WL3Z5VFNjOUVoY0FZTXVzYVFRamFqc1Z6dUg1QkVRTCtXb1JK?=
 =?utf-8?B?NXYvckloK2ZodndXdzFKS1Y3NDFKLytpMS9hVkx1UVkwV2JYSU9mWjF2MWI0?=
 =?utf-8?B?WUdraTZmWWppOGplOGx0K0paSmZKNjRpY2FsMkZjRDAxZ1d2Qm9SdXZndWtH?=
 =?utf-8?B?WHdxUnFwOVU3Tks5SG5ZVTdXejRtbjlWU1ZPakEya3llZml6WEd1N0dYRWhQ?=
 =?utf-8?B?T21YUURGSzBXREVpY01DQ0tQUVkwblgwUUFRVDdDYzFvOWJhbjRINlh0Snl4?=
 =?utf-8?B?OElXWmR3TEdYMDRLTE5TZzI4czQ5Vm1OWi9vVnBCL0pPbkpqRW1FaVBXT08x?=
 =?utf-8?B?cW9OWjl4d3dVdlBOWnhtYkk1YzZ5MG9YakZkVmlDVzVENXdQengxMlFZUHVP?=
 =?utf-8?B?SjdGRVlKUm0vNkpBRTlzMjZEVElXbkJYa1J1NXhSeHBwcUhSYlpZVWZMYzdl?=
 =?utf-8?Q?IhSE4TePIZmlxL2Xtev+?=
X-OriginatorOrg: sct-15-20-8534-15-msonline-outlook-5f066.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: cc0a9623-39d5-4f38-d915-08de1d9cf201
X-MS-Exchange-CrossTenant-AuthSource: GV1P250MB1433.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 01:28:26.9491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P250MB0272
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_172833_684630_6C86A1DD 
X-CRM114-Status: GOOD (  12.40  )
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
We did not confirm if this flush is implemented to guarantee that no
unencrypted frames are sent out on station removal.
Could someone with more knowledge about the firmware behavior check
wether this approach is feasible or if a different approach should be
taken.
It is not clear to me if the approach taken in "wifi: ath10k: Flush
only requested txq in ath10k_flush()" might be better.
https://lore.kernel.org/linux-wireless/01d859e8e574a1f5d0b916333fe0b5cda859=
af9b.1732293922.git.repk@triplefau.lt/
Setting more than 0xFF leads to firmware crashes.

This follow up addresses the requested cosmetic comments.

Regards
Florian

 drivers/net/wireless/ath/ath11k/mac.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/a=
th/ath11k/mac.c
index 3276fe443502..865fa45e1c76 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8640,6 +8640,23 @@ static void ath11k_mac_op_flush(struct ieee80211_hw =
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
+	ret =3D ath11k_wmi_send_peer_flush_tids_cmd(ar, sta->addr, &params);
+	if (ret)
+		ath11k_warn(ar->ab, "failed to flush sta %pM: %d\n", sta->addr, ret);
+}
+
 static bool
 ath11k_mac_has_single_legacy_rate(struct ath11k *ar,
 				  enum nl80211_band band,
@@ -10095,6 +10112,7 @@ static const struct ieee80211_ops ath11k_ops =3D {
 	.set_bitrate_mask		=3D ath11k_mac_op_set_bitrate_mask,
 	.get_survey			=3D ath11k_mac_op_get_survey,
 	.flush				=3D ath11k_mac_op_flush,
+	.flush_sta			=3D ath11k_mac_op_flush_sta,
 	.sta_statistics			=3D ath11k_mac_op_sta_statistics,
 	CFG80211_TESTMODE_CMD(ath11k_tm_cmd)
=20

