Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBA6C5B572
	for <ath11k@archiver.kernel.org>; Sat, 15 Aug 2026 02:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuuZO4zPcnZGIptsG9pWc5OORt4aC+imUiuu/QY31P0=; b=RTv4Uy4k5K069KD/h1UESOEtB1
	3IVu1d1cgaBCNoGLtqnSwCNbRRbBBkzxtXCZwKgkDDw4SuTLVdy11t12Bp3uZbrAJe5gT9nA1iQhZ
	iaTpJzfPQ+o/zIa8NeTDYoUwCUgWofrwSldV/2Xk3CdbW6tS7Mjfy58COS4CKEi8jAk9m0LSYRpMc
	AdzogUve70vSUOfTCkb1rD8vQVIY3wpiQhtxr2QyzHcKhUrQslTL+dROWLRllcw+tXnrafPwyjYI0
	CFP6MJBool7Hw8UZBg+q2pgnpYdojiOh78FZmmbDEwiqsNFciMASFv0rf8NVNkqa0pIS6NWQGxN48
	Oc+eqQag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv4cf-00000003PiG-0sjO;
	Sat, 15 Aug 2026 02:59:49 +0000
Received: from mail-centralusazolkn19011033.outbound.protection.outlook.com ([52.103.13.33] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv4cc-00000003Phv-2Umc
	for ath11k@lists.infradead.org;
	Sat, 15 Aug 2026 02:59:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJ0UQFH21z1D6s+a2iqSLBMp1qwy6dAw5qkm2k8LavRt5ygSlEC0mbzu/fVK6evhVN6U4S8ZhJWm8VVXJnltMaWYJud9B48Al1vBNctGeUx2sRt34xHq+pYFHOE+2bptRFxTvbE5g8fbdXJa89hNFMiOZA9dwbjPfC+hfCnb8nhK5bEj0PAMjOkdPpwlOUItlIa23TRUONWYlf9is7BfEqzSj4nL6HbolM/7Qk/uJFrvWvut4T+kDdqFoDlNkNuxJ1sV4FCOriHWPCSYUcOr5Ffa9ybKo4DY6d7NmglWZkb2jAIld9TusFKOVBbGKMVXUFEeKl1zmZEWD+uYjHCfCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuuZO4zPcnZGIptsG9pWc5OORt4aC+imUiuu/QY31P0=;
 b=wXh3FV0iUfGLl4Opo9olAui7jG7wTYptzPjRls3QQ7JTJzjl+YBpg9kd2wIvjhX4irwKTzpp9V/MQEMUI7kD53BG4vewaICSv2jOlxsLnMCwpu2zsQzBeMvJA+lIn0VRsM/FGLrxTnEVAkGK4olKLh7m/BNzntDlne/vmot5YiP3bsWCSHXxCPCDXTGryuvxV0yyfqZWM+RUupnS8hQlMW3HEKsKprfzWq5HXeM3wmecCg0L0EcdqTlPQRwqZnCrPnxrqL/3Rcb9glRSNlfz+NizXJb/sljFYoWnBoKGM6vj7DIpmNMwqQA4rE5WpOi1l+v9z7sO04lShblSgu6kSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vuuZO4zPcnZGIptsG9pWc5OORt4aC+imUiuu/QY31P0=;
 b=D2QxMsrRYACHKUVnxN5i21kNPlvsnbyLXceds26UO1Qxubq084ZGaNmG4j5BJaGyYsmnB/MEizFi69uCnt6ofTwS4yNCr+qfd0/GvfYo0TwnpGZyiQPMr8y2QuudUpS34jDnIsiOSvK1mD/3IYu0ZL+zqGuUgPfSGxgiZXqOiKcg9enMaXR+QxtJIvA90RzeSumr1D2yo2taaQ5Nt5F+DdlKdqvbMGe5QlSDjjAnlbaODtmDEtfjmTuGVYmgpGi20Vxl4I3BJumBCC6y6yRJnci8WZZRPwmkP1ThhQh36RXl5mPukQv04P4q22lP0gco+MG7SGKsmITlQqKtx/2h9Q==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by DS1PR19MB8722.namprd19.prod.outlook.com (2603:10b6:8:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Sat, 15 Aug
 2026 02:59:40 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0315.011; Sat, 15 Aug 2026
 02:59:40 +0000
Message-ID: <SN7PR19MB6736E8D170938359295F975A9DD92@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Sat, 15 Aug 2026 06:59:32 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix rssi station dump for IPQ5018 and
 QCN6122
To: Christian Marangi <ansuelsmth@gmail.com>,
 Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 P Praneesh <quic_ppranees@quicinc.com>, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Scott Mercer <TheRootEd24@gmail.com>
References: <20251125142821.18152-1-ansuelsmth@gmail.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20251125142821.18152-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: JH0PR01CA0058.apcprd01.prod.exchangelabs.com
 (2603:1096:990:5d::14) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID: <1d03703b-d367-4e32-be94-4c1c75ccb4a9@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|DS1PR19MB8722:EE_
X-MS-Office365-Filtering-Correlation-Id: fb8d1006-e417-4d7c-36f1-08defa793f9b
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799012|22141099003|37011999003|8060799015|24021099003|39105399006|5072599009|15080799012|23021999003|25010399006|4140399003|12121999013|6090799003|40105399003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnhoY1hPNW12VlVEanNZUUZDZ2ZQdGFtZnFKdjM3d2FOc2puOWNsNW5XYVda?=
 =?utf-8?B?d3AwVnZTTkp4T0t1ODRlWTJHNnVJZXRUb1pNbkNvRFc4NmxXSHZpRHU3OU45?=
 =?utf-8?B?NnFmdnM3NWdTd200b0hGUGJoVWsvTnRnK1l2RFlqTTA0SVFLTGwzYkdEWUJG?=
 =?utf-8?B?RUIreTg0NmxRblNtWWlrRDAyVkQ3OW44c0hMNGpKZlRJY2NtZ2ZHa3VrbzZr?=
 =?utf-8?B?ejVkY3BPdEtOU29CWEQ1RFhkbHdIMWVYQW1mbVZFY1JRaC9nelJQSU5LVGJj?=
 =?utf-8?B?Mk02ZmxuU3BoWTdpTk9IbGUrcllSeG5CWWs1eWRKTWp5K3ErWS94NG44VXBx?=
 =?utf-8?B?am03ZjRpV2FLb0k2Y3pCamsvRWtTY1NZVmlxNlI5ZnliTitBaVpuV2FzUzZK?=
 =?utf-8?B?RzJBTUF0ejJWamlXM1JLelJDcnhCaEdKUmZSQ2VHSGRPN2daUjBXVmNieXBR?=
 =?utf-8?B?SUhKN0E5YnJFUW9OdEQveitRV21LdmxsU21KM0JyRmlRZnBScmxOUG00b0Fi?=
 =?utf-8?B?VnFvd2Q1T0R1UVg4cmR3cFRINCs3Zzd3Z3RpYnNuMDkzT3BGZW9yTWVHTkZD?=
 =?utf-8?B?YTNtTVlMblRKNFpXNzk5T0t0YjZBWlVjanR3eE9QTFh4eDdGeGg0UFhVVTYx?=
 =?utf-8?B?cVE2UXBlaG03cjRydm5ZNkZlQlFhUlZiTTBFNkVmaXlDdTZSRkRQeVlUU1Jm?=
 =?utf-8?B?UHpEN05KVEZkTmZXTGVXZWpJbzZIUUlNVzkyMGhiY2xqMGNrbHo5M1ZMVXV1?=
 =?utf-8?B?eE1lSVcrWncwbWtlbGNNZ3F1MHJmMk1SV2NLMmxyM1VEb0hPOEJUblArcFN2?=
 =?utf-8?B?aE9yYzVsanlhMDcrSmRkL3Z0cWVtZWFQKy9GOHJrT0NzeTJGTjRQR2Y2ME9v?=
 =?utf-8?B?bFNFT2tGVGx0RmEyeUplNkZKZ0J2MlpyNldUUXdoaWZSeXpYekRFMmdwOEl6?=
 =?utf-8?B?RUF0RFVleElLVk96VVN3eWtKeDFYQlFoUHJzcWRpWGNYb1d4Y3ZTK0grZmRE?=
 =?utf-8?B?blFwWlJ1UDdiajVQYm1NY2V0K1czTm1ubEd1RmtVZjBIZCtnMXZWTktvNXhV?=
 =?utf-8?B?ZklzeitlNVlLaW1Rd0wzamh4eVN0L0RPSkhCYk4vemJXcG1wRENRS3NnWFov?=
 =?utf-8?B?amJhNXVzc3d3L0FhNFozSE1HdGhPdXNWTDB3Q05hQlZUdUc2aE51RnZyUGZp?=
 =?utf-8?B?MWlmN1crdUZzOUpWT0w5ZU5Vay9WWVltdndFczdoVUJ5S1dPdE1LRGtjM3hQ?=
 =?utf-8?B?eW5uNUxLaFFLUnV1ZXBWbHFBOG8yazFyWUNMUE9lQUFobUtib29CSDdmZlJJ?=
 =?utf-8?B?ZFNQak1GZ1F3QXRNeHRPY3h0cThWMk9sMHF3YzVXbkV2UzQ2U2JHQ0poS3lH?=
 =?utf-8?B?V0cvd1FBLzhOUDZadHJPWktxdTR3UFV4VkRXUGdxenBwM21OM2xiWkhaNnhP?=
 =?utf-8?Q?0k4fxdsS?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ums3bXd3T05mOWlVMFV4S1pCMjRseHlPdlZ2SjlCZWw4NzdESlplZTZVN0Ir?=
 =?utf-8?B?bUNEdlEwa2VvcERRcitLNG9VUXVlNHpkdmVoRURacWxLQmlTenFrSlNMT2tl?=
 =?utf-8?B?a1dWL2hvQWNTYkJvNWJnelBIcDZreUJoSVpkSlQvZzhod0R3RTNJYTBMdHpo?=
 =?utf-8?B?cnNwbjU3bXd2S3FDQWUxQlJYUDhiY21OTno1V2l1NzEwVW96SUtZWmd6cCt6?=
 =?utf-8?B?eVlFM0ZaMzV1cEhBTTRIbU9iVldHaCsrS3ExOVk5Snk1RFV5a0pkYkVsR1Z3?=
 =?utf-8?B?Y0VVa0s0cDV4emlqUG82eHVnVXVnVnFBcUYrTHZFeDZsM3lWSzJuNTEvdmRw?=
 =?utf-8?B?WlJNTTdGZk82SkpKWHEyQWVKME9RaUo4dUxBTWxpUUowOHNOeXFsUVNoSlVR?=
 =?utf-8?B?UDdvdmVQSU55bkRENTgxVjNNYmJlYjhJRTk3TUUwcjNxa0R2d05qbXVSb3d1?=
 =?utf-8?B?YWhRQndVMWNNY1BpN3pSTzVaWUFOeWFjOGthNnVtR2gvTVlSaDdSblRvckxW?=
 =?utf-8?B?M2JEMXVmZHFBVjVzUkdaL1pnellFZGdsSkh0dndyUHJmSWFwemVUWU43Vk5j?=
 =?utf-8?B?ZHB0QS9ETGlNY1RXZG90MXV0a0t0dkovVk5IbE10UHNoeFd5b3c0SlhJTFM1?=
 =?utf-8?B?ZklNU0FPMjh4RlRFTFNQQm04SWZVa3AvUzNRQlBhWisyUnRzU1JQUTQvcVht?=
 =?utf-8?B?cjFGVW1kVUR4OWEzaytvSlRMUENBQkhneVlXSDFrVFh6ZzdrSzhKMzRzUG1C?=
 =?utf-8?B?OGlZVVoxeUhiem9PWlUzc05lY2F3SHlnTkVWeDF6WGdnNGRPNmppSDg1Nld6?=
 =?utf-8?B?alNNYjVVM3RjTW9GZ1pXcHNEajRXRWt4WExZL3dzMmI2aVpJTERxcUJZeHEy?=
 =?utf-8?B?K3dYRGlpamRuTVRZNFd3aHFmZjlEeGVqSXdDVUpTSHZIazNYOVllU08yWHVl?=
 =?utf-8?B?NkpJSGQxTGJBOFI0ekFGQS90d3JuTjMrRzNOOHM2eklsb0xTa2VKc1BCdyt3?=
 =?utf-8?B?bDNrQVVHWHRSc04xdnVRb0o1Z3ZHcW5UTTVGbXllUTd0K3JGWTNibnNNVVJr?=
 =?utf-8?B?Z3ZhaFVoeG5FSmJ6YjlNTkYvaVdoQ3FzT3JZTzI1OTJPNUN1eXdyd3B6b2xr?=
 =?utf-8?B?MmdaMm96UDkvdjg3MzlnYXZTNjUxNDJuQXRCUmRSWmc4b3U1cFF4blJpMS9q?=
 =?utf-8?B?TjQrMjVXUWRkM1pzUnF3VDMzcDZxR3FMcXZxZExJazhHL2daaFhWRkFLeXF3?=
 =?utf-8?B?aUVwcmt1aHpFek5oT0Y5OEtQTVlabFp1NVRCVlBiMzZ6dVBrcGtLaGhVTFZh?=
 =?utf-8?B?RndBSVlxamhVQUsvbS9MZ2lQVzY1K3JjZHNZcG9wVkdHWG02bENuR20rSzQ0?=
 =?utf-8?B?SDE5dFFyaWtrSHo0SkVmdHg4YkdtY1lnb05nZG96THllT215VHYwZVFoSWRV?=
 =?utf-8?B?MXhYTXp4bGNWVnc5U0xhTklGdlVMQmpUTXRZMDlMdktrallMWjJjNlpMNnBv?=
 =?utf-8?B?TmlFSHluL3JrakwxM0oyL09RNlYwbThSakpJNHdvOEtqOFFUSjBKeWIrRFhE?=
 =?utf-8?B?UkwveTNmNUMyZ3RtVlhSNWZndHlrTk5NbnFqQnR1UldEODZqL3lBdmNKQzdB?=
 =?utf-8?B?MWtZMUNENTh5Mm12OXdXTkhlUGtZT21rV3dsMTdjM2JWRHFGdVRaSmNhd3Bp?=
 =?utf-8?B?SlNzODcvNE9lWGpFUlp1VU4xQVhkQlVndXdhTzNTeVM2VnhtWWI5MWVjZnQr?=
 =?utf-8?B?dXRtci9YWEVEa3hZUHZuMFlvYktFL3lZTXBwOU9kOEg3bStVZ1BDVUdIMEVS?=
 =?utf-8?B?VkhYbmhFRDV2K0cxVDVTWWFFaHJiZUhDblViSmVUTW45K09ZOHFUMGdXNlJh?=
 =?utf-8?B?aldxWW1yUXRvS0VYeDNNMm5VRVZaMDBmV295L0QyS2xqaXc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb8d1006-e417-4d7c-36f1-08defa793f9b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2026 02:59:40.5542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR19MB8722
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_195946_651468_0E84B8E5 
X-CRM114-Status: GOOD (  12.68  )
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

Hi all,

On 11/25/25 18:28, Christian Marangi wrote:
> Commit 031ffa6c2cd3 ("wifi: ath11k: fix rssi station dump not updated in
> QCN9074") didn't account for IPQ5018 and QCN6122 WiFi card that are
> based on QCN9074.
> 
> Update the .mpdu_info_get_peerid to use the QCN9074 variant to correctly
> receive consistent RSSI station data.

Is there anything preventing this fix to be reviewed/merged?
I've also tested this and can confirm it's working flawlessly, so:

Tested-by: George Moussalem <george.moussalem@outlook.com>

> 
> Reported-by: Scott Mercer <TheRootEd24@gmail.com>
> Suggested-by: Scott Mercer <TheRootEd24@gmail.com>
> Tested-by: Scott Mercer <TheRootEd24@gmail.com>
> Fixes: 031ffa6c2cd3 ("wifi: ath11k: fix rssi station dump not updated in QCN9074")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/net/wireless/ath/ath11k/hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
> index caa6dc12a790..05d7acbbab56 100644
> --- a/drivers/net/wireless/ath/ath11k/hw.c
> +++ b/drivers/net/wireless/ath/ath11k/hw.c
> @@ -1175,7 +1175,7 @@ const struct ath11k_hw_ops ipq5018_ops = {
>  	.rx_desc_get_attention = ath11k_hw_qcn9074_rx_desc_get_attention,
>  	.reo_setup = ath11k_hw_ipq5018_reo_setup,
>  	.rx_desc_get_msdu_payload = ath11k_hw_qcn9074_rx_desc_get_msdu_payload,
> -	.mpdu_info_get_peerid = ath11k_hw_ipq8074_mpdu_info_get_peerid,
> +	.mpdu_info_get_peerid = ath11k_hw_qcn9074_mpdu_info_get_peerid,
>  	.rx_desc_mac_addr2_valid = ath11k_hw_ipq9074_rx_desc_mac_addr2_valid,
>  	.rx_desc_mpdu_start_addr2 = ath11k_hw_ipq9074_rx_desc_mpdu_start_addr2,
>  	.get_ring_selector = ath11k_hw_ipq8074_get_tcl_ring_selector,


Best regards,
George

