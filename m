Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95717CD484C
	for <ath11k@archiver.kernel.org>; Wed, 13 May 2026 05:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHfpGR+tPaY2TDdziOInxYAYSj6im2Q2BupHyFRZhDA=; b=Y0eDB0Kfq2kB4Nqm7K81abYvDI
	NG07PpUgm9+M9S3iTnT0CuVEtz2Y9o5MR/Vchr6kAzvhbxuuEdwKkoddZwSCUlEH7nscgJ78UdqMY
	+mOoA+a+F5SMXI3xv46ped3EcE4zcn0KliEmrdNAg7p1VCSVvV9B27lcquAJ4tMXgD6Wy2iOSK+3y
	aQBbeUvn7pq4B8sBTgZLEmMCwjRQMCNXAMYppQ259w8viF7xvlzrR8afiTBiS96Fv75CB7fn6P69/
	R7MByHwYtAf9rp8SRqNF9mRMBT6OO3q38FyGRLNWrHJOmRvyd97GXauNfIfLafs+prdWbRXHRKb0r
	OlBKm6vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN21y-00000001J1x-2Rek;
	Wed, 13 May 2026 05:21:14 +0000
Received: from mail.as201155.net ([185.84.6.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN21w-00000001J13-0aUQ
	for ath11k@lists.infradead.org;
	Wed, 13 May 2026 05:21:13 +0000
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]:44204 helo=webmail.newmedia-net.de)
	by mail.as201155.net with esmtps  (TLS1) tls TLS_RSA_WITH_AES_256_CBC_SHA
	(Exim 4.97.1)
	(envelope-from <s.gottschall@dd-wrt.com>)
	id 1wN21i-000000007zt-25cK;
	Wed, 13 May 2026 07:20:59 +0200
X-SASI-Hits: BODY_SIZE_3000_3999 0.000000, BODY_SIZE_5000_LESS 0.000000,
	BODY_SIZE_7000_LESS 0.000000, CTE_7BIT 0.000000, DKIM_ALIGNS 0.000000,
	DKIM_SIGNATURE 0.000000, HTML_00_01 0.050000, HTML_00_10 0.050000,
	IN_REP_TO 0.000000, LEGITIMATE_SIGNS 0.000000,
	MSGID_SAMEAS_FROM_HEX_844412 0.100000, MSG_THREAD 0.000000,
	MSG_THREAD_SOLO 0.000000, NO_CTA_URI_FOUND 0.000000, NO_FUR_HEADER 0.000000,
	NO_URI_HTTPS 0.000000, OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000,
	REFERENCES 0.000000, SENDER_NO_AUTH 0.000000, SUSP_DH_NEG 0.000000,
	USER_AGENT 0.000000, __ANY_URI 0.000000, __BODY_NO_MAILTO 0.000000,
	__BOUNCE_CHALLENGE_SUBJ 0.000000, __BOUNCE_NDR_SUBJ_EXEMPT 0.000000,
	__BULK_NEGATE 0.000000, __CT 0.000000, __CTE 0.000000,
	__CT_TEXT_PLAIN 0.000000, __DKIM_ALIGNS_1 0.000000, __DKIM_ALIGNS_2 0.000000,
	__DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000,
	__FORWARDED_MSG 0.000000, __FRAUD_BADTHINGS 0.000000,
	__FUR_RDNS_SOPHOS 0.000000, __HAS_FROM 0.000000, __HAS_MSGID 0.000000,
	__HAS_REFERENCES 0.000000, __HEADER_ORDER_FROM 0.000000,
	__IN_REP_TO 0.000000, __MAIL_CHAIN 0.000000, __MIME_BOUND_CHARSET 0.000000,
	__MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
	__MIME_VERSION 0.000000, __MOZILLA_USER_AGENT 0.000000,
	__MSGID_DOMAIN_IN_REFERENCES 0.000000, __MSGID_HEX_844412 0.000000,
	__MULTIPLE_RCPTS_TO_X2 0.000000, __NO_HTML_TAG_RAW 0.000000,
	__OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
	__OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __RCVD_PASS 0.000000,
	__REFERENCES 0.000000, __SANE_MSGID 0.000000, __SCAN_D_NEG 0.000000,
	__SCAN_D_NEG2 0.000000, __SCAN_D_NEG_HEUR 0.000000,
	__SCAN_D_NEG_HEUR2 0.000000, __SL_HEAVY 0.000000, __SUBJ_ALPHA_END 0.000000,
	__SUBJ_ALPHA_NEGATE 0.000000, __SUBJ_REPLY 0.000000,
	__TO_MALFORMED_2 0.000000, __TO_NAME 0.000000,
	__TO_NAME_DIFF_FROM_ACC 0.000000, __TO_REAL_NAMES 0.000000,
	__URI_MAILTO 0.000000, __URI_NO_WWW 0.000000, __URI_NS 0.000000,
	__USER_AGENT 0.000000, __X_MAILSCANNER 0.000000
X-SASI-Probability: 8%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 5.1.4, AntispamData: 2026.5.13.45719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dd-wrt.com; s=mikd;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID; bh=vHfpGR+tPaY2TDdziOInxYAYSj6im2Q2BupHyFRZhDA=;
	b=jWCNmHVIuTEijiJJSZ6N6dBmrYo4CVpRB8/N50q34ais55HZbbX7OEPOhXxaFJ58Q0gw3ATTyu5N8sDkRqh3NhsrY7rU1byPHM8n2I95ueO7ICzWG0cY2FlwlVUZCNP1i3noulkfyPAJLq/xOJdGpTA+z2BpzH+9FQgOiIH3KeY=;
Message-ID: <d4a6da02-632f-4bc0-b8dd-6d3b001e4350@dd-wrt.com>
Date: Wed, 13 May 2026 07:20:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] wifi: ath11k: fix txpower in ap mode for 6 Ghz
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, ath11k@lists.infradead.org
References: <20260512204851.2634163-1-s.gottschall@dd-wrt.com>
 <17060e4f-f0f9-4842-9460-82422d23a8c1@oss.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
In-Reply-To: <17060e4f-f0f9-4842-9460-82422d23a8c1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass (webmail.newmedia-net.de: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=s.gottschall@dd-wrt.com; helo=webmail.newmedia-net.de;
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: s.gottschall@dd-wrt.com
X-SA-Exim-Scanned: No (on webmail.newmedia-net.de); SAEximRunCond expanded to false
X-NMN-MailScanner-Information: Please contact the ISP for more information
X-NMN-MailScanner-ID: 1wN21i-0004FR-B8
X-NMN-MailScanner: Found to be clean
X-NMN-MailScanner-From: s.gottschall@dd-wrt.com
X-Received: from localhost ([127.0.0.1] helo=webmail.newmedia-net.de)
	by webmail.newmedia-net.de with esmtp (Exim 4.72)
	(envelope-from <s.gottschall@dd-wrt.com>)
	id 1wN21i-0004FR-B8; Wed, 13 May 2026 07:20:58 +0200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_222112_337728_F55FFE1A 
X-CRM114-Status: GOOD (  20.08  )
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


Am 13.05.2026 um 03:56 schrieb Baochen Qiang:
>
> On 5/13/2026 4:48 AM, Sebastian Gottschall wrote:
>> there is an issue which has been discovered a while ago while testing
>> which killed txpower to 0dbm once scanning is triggered in AP mode
>> on QCN9074 based chipsets if 6 Ghz is in use.
>> ath11k_wmi_send_vdev_set_tpc_power must be set in AP mode in the same
>> way is it is for STA as it is implemented in ath12k and in the
>> qsdk version for ath11k.
>> this patch must be considered to be backported (i discovered that issue
>> already 2 years ago)
>>
>> Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
>> ---
>>   drivers/net/wireless/ath/ath11k/mac.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
>> index a48b6bf1f29a..dc192152b2e8 100644
>> --- a/drivers/net/wireless/ath/ath11k/mac.c
>> +++ b/drivers/net/wireless/ath/ath11k/mac.c
>> @@ -3497,13 +3497,14 @@ static int ath11k_mac_config_obss_pd(struct ath11k *ar,
>>   	return 0;
>>   }
>>   
>> -static bool ath11k_mac_supports_station_tpc(struct ath11k *ar,
>> +static bool ath11k_mac_supports_tpc(struct ath11k *ar,
>>   					    struct ath11k_vif *arvif,
>>   					    const struct cfg80211_chan_def *chandef)
>>   {
>>   	return ath11k_wmi_supports_6ghz_cc_ext(ar) &&
>>   		test_bit(WMI_TLV_SERVICE_EXT_TPC_REG_SUPPORT, ar->ab->wmi_ab.svc_map) &&
>> -		arvif->vdev_type == WMI_VDEV_TYPE_STA &&
>> +		(arvif->vdev_type == WMI_VDEV_TYPE_STA ||
>> +		arvif->vdev_type == WMI_VDEV_TYPE_AP) &&
>>   		arvif->vdev_subtype == WMI_VDEV_SUBTYPE_NONE &&
>>   		chandef->chan &&
>>   		chandef->chan->band == NL80211_BAND_6GHZ;
>> @@ -7647,8 +7648,8 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
>>   	/* TODO: For now we only set TPC power here. However when
>>   	 * channel changes, say CSA, it should be updated again.
>>   	 */
>> -	if (ath11k_mac_supports_station_tpc(ar, arvif, chandef)) {
>> -		ath11k_mac_fill_reg_tpc_info(ar, arvif->vif, &arvif->chanctx);
>> +	if (ath11k_mac_supports_tpc(ar, arvif, chandef)) {
>> +		ath11k_mac_fill_reg_tpc_info(ar, arvif->vif, ctx);
> is this intentional change? I doubt it even doesn't compile.
in addition. i compile tested it. and if you talk about the change from 
arvid->chanctx to ctx. this valid
arvif->chanctx is not always set. the only trustworthy source is ctx and 
represents the current channel context.
there was never a reason to use arvif->chanctx

Sebastian

>
>>   		ath11k_wmi_send_vdev_set_tpc_power(ar, arvif->vdev_id,
>>   						   &arvif->reg_tpc_info);
>>   	}
> the ath12k patch has additional changes to hardcode power_type to LPI for an AP vdev,
> should it be done for ath11k as well?
>
> commit a44958c83e52238996a48e7d604167c9b9d0a529
> Author: Hariharan Basuthkar <quic_hbasuthk@quicinc.com>
> Date:   Fri Jun 6 16:53:16 2025 +0530
>
>      wifi: ath12k: Send WMI_VDEV_SET_TPC_POWER_CMD for AP vdev
>
>      [...]
>
>      For a AP vdev, hardcode ap_power_type as IEEE80211_REG_LPI_AP, which is
>      filled in the WMI_VDEV_SET_TPC_POWER_CMDID sent to the target.
>      Currently, LPI is the only supported AP power mode. Since there is
>      no method currently to set the AP power mode from user-space, the
>      power mode is hard-coded to LPI.
>
>

