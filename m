Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D136CD4F21
	for <ath11k@archiver.kernel.org>; Wed, 13 May 2026 18:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPZ9DKsbd6jlvhR01fVXr389JIJy/RFao/v/iVaNE/c=; b=GwqlhImKbVb/rMfaCntZdD8A3C
	R8GMcIOduMVmVIhviOB6WjJC+Zdc8qjQqPyEjitPY5Iv7a3mrwDfziO/Vh8kmeNDmdT1kX/q0Q/9Z
	Nr/fEV1nUpu5LH4twVpIT3sif/87+77zfCnNwHjUZ2ycZf74+uIVkbrx9gN3bvtbBzfUtL+twd1pm
	L7al6rMkx8teObNBT2NDyIOG28foLR3koZqCnYYf+jPqo6bXCTRv+3cH6GN9fXvnaeRYxuH0pnmh/
	pTlVkj95J6SuyEfg5l/y52BWmNYt7QsjGpByK8vUIPrfX02lsFzFkLcz/vTDrseIvPvE2yRakZCxG
	yMXETt2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEMw-00000003TjR-1KIa;
	Wed, 13 May 2026 18:31:42 +0000
Received: from mail.as201155.net ([185.84.6.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEMt-00000003Tis-0TPR
	for ath11k@lists.infradead.org;
	Wed, 13 May 2026 18:31:40 +0000
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]:59090 helo=webmail.newmedia-net.de)
	by mail.as201155.net with esmtps  (TLS1) tls TLS_RSA_WITH_AES_256_CBC_SHA
	(Exim 4.97.1)
	(envelope-from <s.gottschall@dd-wrt.com>)
	id 1wNEMo-000000001VP-1WAm;
	Wed, 13 May 2026 20:31:34 +0200
X-SASI-Hits: BODYTEXTP_SIZE_3000_LESS 0.000000, BODY_SIZE_2000_2999 0.000000,
	BODY_SIZE_5000_LESS 0.000000, BODY_SIZE_7000_LESS 0.000000,
	CTE_7BIT 0.000000, DKIM_ALIGNS 0.000000, DKIM_SIGNATURE 0.000000,
	HTML_00_01 0.050000, HTML_00_10 0.050000, IN_REP_TO 0.000000,
	LEGITIMATE_SIGNS 0.000000, MSGID_SAMEAS_FROM_HEX_844412 0.100000,
	MSG_THREAD 0.000000, MSG_THREAD_SOLO 0.000000, NO_CTA_URI_FOUND 0.000000,
	NO_FUR_HEADER 0.000000, NO_URI_HTTPS 0.000000, OUTBOUND 0.000000,
	OUTBOUND_SOPHOS 0.000000, REFERENCES 0.000000, SENDER_NO_AUTH 0.000000,
	SUSP_DH_NEG 0.000000, USER_AGENT 0.000000, __ANY_URI 0.000000,
	__BODY_NO_MAILTO 0.000000, __BOUNCE_CHALLENGE_SUBJ 0.000000,
	__BOUNCE_NDR_SUBJ_EXEMPT 0.000000, __BULK_NEGATE 0.000000, __CT 0.000000,
	__CTE 0.000000, __CT_TEXT_PLAIN 0.000000, __DKIM_ALIGNS_1 0.000000,
	__DKIM_ALIGNS_2 0.000000, __DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR 0.000000,
	__DQ_NEG_IP 0.000000, __FORWARDED_MSG 0.000000, __FRAUD_BADTHINGS 0.000000,
	__FUR_RDNS_SOPHOS 0.000000, __HAS_FROM 0.000000, __HAS_MSGID 0.000000,
	__HAS_REFERENCES 0.000000, __HEADER_ORDER_FROM 0.000000,
	__INVOICE_MULTILINGUAL 0.000000, __IN_REP_TO 0.000000, __MAIL_CHAIN 0.000000,
	__MIME_BOUND_CHARSET 0.000000, __MIME_TEXT_ONLY 0.000000,
	__MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000, __MIME_VERSION 0.000000,
	__MOZILLA_USER_AGENT 0.000000, __MSGID_DOMAIN_IN_REFERENCES 0.000000,
	__MSGID_HEX_844412 0.000000, __MULTIPLE_RCPTS_TO_X2 0.000000,
	__NO_HTML_TAG_RAW 0.000000, __OUTBOUND_SOPHOS_FUR 0.000000,
	__OUTBOUND_SOPHOS_FUR_IP 0.000000, __OUTBOUND_SOPHOS_FUR_RDNS 0.000000,
	__RCVD_PASS 0.000000, __REFERENCES 0.000000, __SANE_MSGID 0.000000,
	__SCAN_D_NEG 0.000000, __SCAN_D_NEG2 0.000000, __SCAN_D_NEG_HEUR 0.000000,
	__SCAN_D_NEG_HEUR2 0.000000, __SL_HEAVY 0.000000, __SUBJ_ALPHA_END 0.000000,
	__SUBJ_ALPHA_NEGATE 0.000000, __SUBJ_REPLY 0.000000,
	__TO_MALFORMED_2 0.000000, __TO_NAME 0.000000,
	__TO_NAME_DIFF_FROM_ACC 0.000000, __TO_REAL_NAMES 0.000000,
	__URI_MAILTO 0.000000, __URI_NO_WWW 0.000000, __URI_NS 0.000000,
	__USER_AGENT 0.000000, __X_MAILSCANNER 0.000000
X-SASI-Probability: 8%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 5.1.4, AntispamData: 2026.5.13.175719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dd-wrt.com; s=mikd;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID; bh=XPZ9DKsbd6jlvhR01fVXr389JIJy/RFao/v/iVaNE/c=;
	b=bv/WvLaNr6URDRtxRwLrskPyaJ6ZKUjSAmdXogAqPHIhiMrHfzW1Yv6atVk/81SeZzFnV/0LTImQ/3DE2CEbkWAE+7M8UNhw4JDUxaOo1702GRpAgFzyENbGvEjsHJQ8Df65XMHUvpQPUyNmdioV2yMolI01GpcfFj9g1zt0zyY=;
Message-ID: <6c228c2c-fa84-4a4c-aee1-31c13ef65945@dd-wrt.com>
Date: Wed, 13 May 2026 20:31:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] wifi: ath11k: fix txpower in ap mode for 6 Ghz
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath11k@lists.infradead.org
References: <20260512204851.2634163-1-s.gottschall@dd-wrt.com>
 <3b56b221-29a2-450e-bcfa-1c929ee0be5e@oss.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
In-Reply-To: <3b56b221-29a2-450e-bcfa-1c929ee0be5e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass (webmail.newmedia-net.de: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=s.gottschall@dd-wrt.com; helo=webmail.newmedia-net.de;
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: s.gottschall@dd-wrt.com
X-SA-Exim-Scanned: No (on webmail.newmedia-net.de); SAEximRunCond expanded to false
X-NMN-MailScanner-Information: Please contact the ISP for more information
X-NMN-MailScanner-ID: 1wNEMm-000A5V-Eh
X-NMN-MailScanner: Found to be clean
X-NMN-MailScanner-From: s.gottschall@dd-wrt.com
X-Received: from localhost ([127.0.0.1] helo=webmail.newmedia-net.de)
	by webmail.newmedia-net.de with esmtp (Exim 4.72)
	(envelope-from <s.gottschall@dd-wrt.com>)
	id 1wNEMm-000A5V-Eh; Wed, 13 May 2026 20:31:32 +0200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_113139_296103_144949F4 
X-CRM114-Status: GOOD (  14.59  )
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


Am 13.05.2026 um 18:06 schrieb Jeff Johnson:
> On 5/12/2026 1:48 PM, Sebastian Gottschall wrote:
>> there is an issue which has been discovered a while ago while testing
>> which killed txpower to 0dbm once scanning is triggered in AP mode
>> on QCN9074 based chipsets if 6 Ghz is in use.
> s/Ghz/GHz/ to align with SI (also in subject)
>> ath11k_wmi_send_vdev_set_tpc_power must be set in AP mode in the same
>> way is it is for STA as it is implemented in ath12k and in the
>> qsdk version for ath11k.
>> this patch must be considered to be backported (i discovered that issue
>> already 2 years ago)
> There needs to be a Fixes tag for any patch to be considered for backporting
> by the stable team
i will follow up with a v2 version which also considers the LPI power 
setting mentioned by Baochen Qiang
but need to test this first
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
> CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
>
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
>>   		ath11k_wmi_send_vdev_set_tpc_power(ar, arvif->vdev_id,
>>   						   &arvif->reg_tpc_info);
>>   	}
>

