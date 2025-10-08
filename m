Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC214CCA470
	for <ath11k@archiver.kernel.org>; Wed,  8 Oct 2025 06:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjAFkAwnsi4tcxNNj3MNh9UFNQuCts5SaEEBlOZE+2o=; b=zaJu99kO/bONRW2sfL3idA+hWy
	Q9jYz68ux8eBmcb457eEE0Fm+Xg+jyLQXCkpTopTUn6g8hxClZPUCohbT/buY5S6SbLstDR4wuaQW
	NUJYP/tLuqGG0fzEBPDfZhaXH9Elr/bzj0PsevoMc73aXxCtJh54qVziKusyxRTmciaeurXx7n6Bt
	8YM+1PHGNTxrHEVo49+jwQ2ZYpihTevn4wpznUpcjst83EtksXnqbVkRSSyID15bzg1v8YBbth94m
	k6TAlgnCqrxrsmrzUm5GtE0OjfqFJqemRm6Q97rdu2jiw+lg6W5Anhl8j6TY/Ulxw615afUznsFP4
	42gL2+6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6NMw-00000003GTF-1FOp;
	Wed, 08 Oct 2025 06:09:46 +0000
Received: from mail.as201155.net ([185.84.6.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6NMt-00000003GSq-2V54
	for ath11k@lists.infradead.org;
	Wed, 08 Oct 2025 06:09:45 +0000
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]:49592 helo=webmail.newmedia-net.de)
	by mail.as201155.net with esmtps  (TLS1) tls TLS_RSA_WITH_AES_256_CBC_SHA
	(Exim 4.97.1)
	(envelope-from <s.gottschall@dd-wrt.com>)
	id 1v6NMq-000000001Wu-06QM;
	Wed, 08 Oct 2025 08:09:40 +0200
X-SASI-Hits: BODY_SIZE_4000_4999 0.000000, BODY_SIZE_5000_LESS 0.000000,
	BODY_SIZE_7000_LESS 0.000000, CTE_7BIT 0.000000, DKIM_ALIGNS 0.000000,
	DKIM_SIGNATURE 0.000000, HTML_00_01 0.050000, HTML_00_10 0.050000,
	IN_REP_TO 0.000000, LEGITIMATE_SIGNS 0.000000,
	MSGID_SAMEAS_FROM_HEX_844412 0.100000, MSG_THREAD 0.000000,
	MULTIPLE_REAL_RCPTS 0.000000, NO_FUR_HEADER 0.000000, OUTBOUND 0.000000,
	OUTBOUND_SOPHOS 0.000000, REFERENCES 0.000000, SENDER_NO_AUTH 0.000000,
	SUSP_DH_NEG 0.000000, URI_WITH_PATH_ONLY 0.000000, USER_AGENT 0.000000,
	__ANY_URI 0.000000, __BODY_NO_MAILTO 0.000000,
	__BOUNCE_CHALLENGE_SUBJ 0.000000, __BOUNCE_NDR_SUBJ_EXEMPT 0.000000,
	__BULK_NEGATE 0.000000, __CP_URI_IN_BODY 0.000000, __CT 0.000000,
	__CTE 0.000000, __CT_TEXT_PLAIN 0.000000, __DKIM_ALIGNS_1 0.000000,
	__DKIM_ALIGNS_2 0.000000, __DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR 0.000000,
	__DQ_NEG_IP 0.000000, __FORWARDED_MSG 0.000000,
	__FRAUD_BODY_WEBMAIL 0.000000, __FRAUD_WEBMAIL 0.000000,
	__FROM_DOMAIN_NOT_IN_BODY 0.000000, __FUR_RDNS_SOPHOS 0.000000,
	__HAS_CC_HDR 0.000000, __HAS_FROM 0.000000, __HAS_MSGID 0.000000,
	__HAS_REFERENCES 0.000000, __HEADER_ORDER_FROM 0.000000,
	__HTTPS_URI 0.000000, __INVOICE_MULTILINGUAL 0.000000, __IN_REP_TO 0.000000,
	__MAIL_CHAIN 0.000000, __MIME_BOUND_CHARSET 0.000000,
	__MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
	__MIME_VERSION 0.000000, __MOZILLA_USER_AGENT 0.000000,
	__MSGID_HEX_844412 0.000000, __MULTIPLE_RCPTS_TO_X2 0.000000,
	__MULTIPLE_URI_TEXT 0.000000, __NO_HTML_TAG_RAW 0.000000,
	__OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
	__OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __PHISH_SPEAR_SUBJ_PREDICATE 0.000000,
	__RCVD_PASS 0.000000, __REFERENCES 0.000000, __SANE_MSGID 0.000000,
	__SCAN_D_NEG 0.000000, __SCAN_D_NEG2 0.000000, __SCAN_D_NEG_HEUR 0.000000,
	__SCAN_D_NEG_HEUR2 0.000000, __SUBJ_ALPHA_END 0.000000,
	__SUBJ_ALPHA_NEGATE 0.000000, __SUBJ_REPLY 0.000000,
	__TO_MALFORMED_2 0.000000, __TO_NAME 0.000000,
	__TO_NAME_DIFF_FROM_ACC 0.000000, __TO_REAL_NAMES 0.000000,
	__URI_ENDS_IN_SLASH 0.000000, __URI_HAS_HYPHEN_USC 0.000000,
	__URI_IN_BODY 0.000000, __URI_MAILTO 0.000000, __URI_NOT_IMG 0.000000,
	__URI_NO_WWW 0.000000, __URI_NS 0.000000, __URI_WITH_PATH 0.000000,
	__USER_AGENT 0.000000, __X_MAILSCANNER 0.000000
X-SASI-Probability: 8%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 5.1.4, AntispamData: 2025.10.8.52719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dd-wrt.com; s=mikd;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID; bh=ZjAFkAwnsi4tcxNNj3MNh9UFNQuCts5SaEEBlOZE+2o=;
	b=lDQfOP/On/CBvYS/kgOztXi4K7Ur+qLc+4/FsoRyZxasNTLO+cNfDN2dZM23HAsOeKSKlUFHNwFKt5TxHzropEiaIMvUn3Q4+G0mcZs/GI2BYcd2ei00k6TR5W4YUBxXCL4b8BEMC8qV5jr4n44frcROUwjgqbZ6CHFx4//NaCU=;
Message-ID: <822673fe-174f-472e-8874-783198e22300@dd-wrt.com>
Date: Wed, 8 Oct 2025 08:09:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH] ath11k: add ath11k_mac_op_flush_sta to properly flush
 pending packets
To: Florian Maurer <f.maurer@outlook.de>, Jeff Johnson <jjohnson@kernel.org>,
 ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <GV1P250MB14333A5BF24623C4753A10E1E8E0A@GV1P250MB1433.EURP250.PROD.OUTLOOK.COM>
 <236b48e6-43c3-4d2e-a864-3ba627101c90@dd-wrt.com>
 <GV1P250MB14333099108FC4461F201AE3E8E0A@GV1P250MB1433.EURP250.PROD.OUTLOOK.COM>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
In-Reply-To: <GV1P250MB14333099108FC4461F201AE3E8E0A@GV1P250MB1433.EURP250.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass (webmail.newmedia-net.de: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=s.gottschall@dd-wrt.com; helo=webmail.newmedia-net.de;
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: s.gottschall@dd-wrt.com
X-SA-Exim-Scanned: No (on webmail.newmedia-net.de); SAEximRunCond expanded to false
X-NMN-MailScanner-Information: Please contact the ISP for more information
X-NMN-MailScanner-ID: 1v6NMo-0004kr-RP
X-NMN-MailScanner: Found to be clean
X-NMN-MailScanner-From: s.gottschall@dd-wrt.com
X-Received: from localhost ([127.0.0.1] helo=webmail.newmedia-net.de)
	by webmail.newmedia-net.de with esmtp (Exim 4.72)
	(envelope-from <s.gottschall@dd-wrt.com>)
	id 1v6NMo-0004kr-RP; Wed, 08 Oct 2025 08:09:38 +0200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_230943_803041_EC86BAF4 
X-CRM114-Status: GOOD (  17.49  )
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


Am 07.10.2025 um 15:59 schrieb Florian Maurer:
> On Tue, 2025-10-07 at 14:38 +0200, Sebastian Gottschall wrote:
>> Am 07.10.2025 um 10:11 schrieb Florian Maurer:
>>
>>> When a STA is marked as no longer authorized, if the driver doesn't
>>> implement flush_sta(), mac80211 calls ieee80211_flush_queues() to
>>> flush hardware queues to avoid sending unencrypted frames.
>>>
>>> This has became a problem for ath11k because ieee80211_flush_queues()
>>> will stop all traffic and call ath11k_flush, which waits until the
>>> whole HW queue is empty. In a busy environment this will trigger a
>>> timeout warning and stalls other STAs.
>>>
>>> Fix this by implementing flush_sta method using WMI command to flush
>>> frames of a specific STA.
>>> Flushed frames will be marked as discard in tx complete indication.
>>>
>>> warning print "ath11k c000000.wifi: failed to flush transmit queue 0"
>>> was observed on various openwrt devices, and is fixed through this patch.
>>>
>>> Signed-off-by: Florian Maurer <f.maurer@outlook.de>
>>> Tested-by: Florian Maurer  <f.maurer@outlook.de>
>>> Co-authored-by: Benjamin Berg <benjamin@sipsolutions.net>
>>> Tested-by: Flole <flole@flole.de>
>>> ---
>>> We tested this patch and it solved the problem of flushing the transmit
>>> queues taking too long when the AP is busy.
>>> We did not confirm if this flush is implemented to guarantee that no
>>> unencrypted frames are sent out on station removal.
>>> Could someone with more knowledge about the firmware behavior check
>>> wether this approach is feasible or if a different approach should be
>>> taken.
>>> It is not clear to me if the approach taken in "wifi: ath10k: Flush
>>> only requested txq in ath10k_flush()" might be better.
>>> https://lore.kernel.org/linux-wireless/01d859e8e574a1f5d0b916333fe0b5cda859af9b.1732293922.git.repk@triplefau.lt/
>>>
>>> Regards
>>> Florian
>>>
>>>    drivers/net/wireless/ath/ath11k/mac.c | 19 +++++++++++++++++++
>>>    1 file changed, 19 insertions(+)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
>>> index 106e2530b64e..a94649edd4ed 100644
>>> --- a/drivers/net/wireless/ath/ath11k/mac.c
>>> +++ b/drivers/net/wireless/ath/ath11k/mac.c
>>> @@ -8330,6 +8330,24 @@ static void ath11k_mac_op_flush(struct ieee80211_hw *hw, struct ieee80211_vif *v
>>>    	ath11k_mac_flush_tx_complete(ar);
>>>    }
>>>    
>>> +static void ath11k_mac_op_flush_sta(struct ieee80211_hw *hw,
>>> +							struct ieee80211_vif *vif,
>>> +			    			struct ieee80211_sta *sta)
>>> +{
>>> +	struct ath11k_vif *arvif = (void *)vif->drv_priv;
>>> +	struct ath11k *ar = hw->priv;
>>> +	struct peer_flush_params params = {
>>> +		.peer_tid_bitmap = 0xFF,
>>> +		.vdev_id = arvif->vdev_id,
>>> +	};
>>> +	int ret = 0;
>>> +
>>> +	ret = ath11k_wmi_send_peer_flush_tids_cmd(ar, sta->addr, &params);
>>> +	if (ret)
>>> +		ath11k_warn(ar->ab, "failed to flush sta (sta %pM)\n",
>>> +			    sta->addr);
>>> +}
>>> +
>>>    static bool
>>>    ath11k_mac_has_single_legacy_rate(struct ath11k *ar,
>>>    				  enum nl80211_band band,
>>> @@ -9920,6 +9938,7 @@ static const struct ieee80211_ops ath11k_ops = {
>>>    	.set_bitrate_mask		= ath11k_mac_op_set_bitrate_mask,
>>>    	.get_survey			= ath11k_mac_op_get_survey,
>>>    	.flush				= ath11k_mac_op_flush,
>>> +	.flush_sta			= ath11k_mac_op_flush_sta,
>>>    	.sta_statistics			= ath11k_mac_op_sta_statistics,
>>>    	CFG80211_TESTMODE_CMD(ath11k_tm_cmd)
>>>    
>> why is peer_tid_bitmap 0xff instead of 0xffffffff?
> When setting it to 0xffffffff it fails with:
> Assertion !CHK_TID_FLG(ptid, WAL_TID_IN_SCHEDQ) failedparam0 :zero,
> param1 :zero, param2 :zero.
> leading to a device reboot. See:
> https://github.com/openwrt/openwrt/pull/20293#issuecomment-3367037471
> It works with 0xffff though, but I don't quite know what the firmware
> does/expects here. Maybe someone with more information can help.
due the sources. BIT 17 has a special purpose named WMI_MGMT_TID
all bits can be masked but bit 17 as it seems
>

