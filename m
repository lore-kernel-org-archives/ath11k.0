Return-Path: <SRS0=20C1=QG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D07C433F5
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 13:18:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 114DD60295
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 13:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 114DD60295
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lTyBZJy47ize4e2JSXIn4wUBZKkaRDcpn3DKrVy0rSg=; b=zd7h71oKDbfjUv
	X8uDU/Yyg+V4qEQLREwa1krL3cH+mfEtLmnoHmb3MH4THVvfwMbV2bGAa3zbJXOUiGBDH3IlpiPbU
	c5k1uisHedkT847wX2dTC/XSBBdP1Du7/m1T+BH/pHlw9atEy2mfPFO9+fGdB00sYTO6ikShxCXru
	oW1Xx4iCq5jIVdAqWvmUBeoiOdX6bUDP+CwQFbJKz6+s3q1MiojViiWD2AH7anlI/TK99detNZGNT
	vs11I5C5ZhLP5IhRNNfPaFKVeTEqMD43la8/Bg5iylNmFFl23O98QnV1cx1SOIktEth2k+8qwHi13
	8HYxiNQaCNZ3/VztkmCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo3n4-00ASwt-V1; Fri, 19 Nov 2021 13:18:54 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo3n2-00ASwL-Ig
 for ath11k@lists.infradead.org; Fri, 19 Nov 2021 13:18:54 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637327932; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=Wck6NOaOoYELP3rHiVyP8Z90LffSed4WfOHa0BN+KGw=;
 b=Zs31ujopw0y1ELRbcvbDKEjH4y76PUDZWq4PYtOItvOoDjc3THAIB9Kops5vqBAy6MsFeiz8
 JmbYvJld+19ncdPeciDND32WfnzdS43rxQfl+bjey4Ls0kEOLuzWwHXMXcy3z3ZqlgtTN89K
 kvYi2XjOxsJdQtqrc2OhxNd6Aa4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6197a43bf5c956d49e59c3e6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Nov 2021 13:18:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B23EDC4360C; Fri, 19 Nov 2021 13:18:51 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DD9C2C4338F;
 Fri, 19 Nov 2021 13:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org DD9C2C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Wen Gong <wgong@codeaurora.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH] ath11k: add read variant from SMBIOS for download board
 data
References: <20211011082433.30415-1-wgong@codeaurora.org>
 <163713928364.10263.15372409026240983506.kvalo@codeaurora.org>
 <d9ff63f49c50b0561932be77bed5ce87@codeaurora.org>
 <9abb629d45130da8847679e090c3e4cf@codeaurora.org>
Date: Fri, 19 Nov 2021 15:18:47 +0200
In-Reply-To: <9abb629d45130da8847679e090c3e4cf@codeaurora.org> (Wen Gong's
 message of "Fri, 19 Nov 2021 15:58:43 +0800")
Message-ID: <874k88cmh4.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_051852_703742_58EFF3F9 
X-CRM114-Status: GOOD (  19.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Wen Gong <wgong@codeaurora.org> writes:

> On 2021-11-18 18:25, Wen Gong wrote:
>> On 2021-11-17 16:54, Kalle Valo wrote:
>>> Wen Gong <wgong@codeaurora.org> wrote:
>>>
>>>> This is to read variant from SMBIOS such as read from DT, the variant
>>>> string will be used to one part of string which used to search board
>>>> data from board-2.bin.
>>>>
>>>> Tested-on: WCN6855 hw2.0 PCI
>>>> WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>>>>
>>>> Signed-off-by: Wen Gong <wgong@codeaurora.org>
>>>
>>> I'm dropping all patches listed below in one go. I didn't manage to
>>> apply any of these without conflicts, please remember to always use
>>> ath.git master branch as the baseline to avoid conflicts.
>>>
>>> 9 patches set to Changes Requested.
>>>
>>> 12549401 ath11k: add read variant from SMBIOS for download board data
>>> 12549415 ath11k: add wait operation for tx management packets for
>>> flush from mac80211
>>> 12549419 ath11k: change to treat alpha code na as world wide regdomain
>>> 12549431 ath11k: report rssi of each chain to mac80211
>>> 12549433 ath11k: Add signal report to mac80211 for QCA6390 and WCN6855
>>> 12549449 ath11k: report tx bitrate for iw wlan station dump
>>> 12554953 ath11k: add support for hardware rfkill for QCA6390
>>> 12583807 ath11k: add 11d scan offload support
>>> 12583809 ath11k: calculate the correct NSS of peer for HE capabilities
>>
>> I have rebased to latest ath.git master ath-202111170737 and resend v2
>> for below patches:
>> [v2] ath11k: report rssi of each chain to mac80211
>> [v2,0/2] ath11k: add 11d scan offload support for QCA6390/WCN6855
>> [v2] ath11k: add read variant from SMBIOS for download board data
>> [v2] ath11k: skip sending vdev down for channel switch
>> [v2] ath11k: fix read fail for htt_stats and htt_peer_stats for
>> single pdev
>> [v2] ath11k: calculate the correct NSS of peer for HE capabilities
>> [v2] ath11k: add wait operation for tx management packets for flush
>> from mac80211
>> [v2] ath11k: change to treat alpha code na as world wide regdomain
>>
>> I will rebase the left patches after these patches upstream, otherwise
>> the left patches will have conflict with these patches
>> because they change same location but actually have no logic relation.
>
> Hi Kalle,
>
> I have tested in my local git, all the above v2 patches only have one
> conflict
> between "[v2,2/2] ath11k: add 11d scan offload support"
> and "[v2] ath11k: report rssi of each chain to mac80211"
> in wmi_tlv_policies of wmi.c because they both add a item in the struct.
> patch -p1 -i xxx.patch will auto fix this type conflict.
>
> +       [WMI_TAG_11D_NEW_COUNTRY_EVENT] = {
> +               .min_len = sizeof(struct wmi_11d_new_cc_ev) },
>
> +       [WMI_TAG_PER_CHAIN_RSSI_STATS] = {
> +               .min_len = sizeof(struct wmi_per_chain_rssi_stats) },

Thanks, this was very helpful. I have the patches now in the pending
branch, I'll test and review them next week.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
