Return-Path: <SRS0=748x=PQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D774C433EF
	for <ath11k@archiver.kernel.org>; Thu, 28 Oct 2021 12:19:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44B36610FC
	for <ath11k@archiver.kernel.org>; Thu, 28 Oct 2021 12:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44B36610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qtOnX/EOk3tmRvqmHQNAE77nN77pRCiFOq3uRR858NM=; b=O/JpWGeS2t/gS2
	GbXilnkwQUGUpJNLPsGaJIfeoI66yzl2g/VwzsP55bDCZaeiLvnBIDduwaUWx8wrVIFiRzwZ+ynzr
	tfcKh7P4jfHdGUYWepPruWufjmbQjD48TSTHA5SzwKikvzK9XNE474g+P31ifdV5QTeo1yxXcAc+9
	TK+VysvjGThP/z5lD6OSiParPZgKYECp5M42xHRj8yAzkm+mR46Dw9fizNX+3KvQ5WvRZoiFicVOV
	8eGubtOYnjRYTuhMaUXOG6SkjbwdEJ5Y9kveSTcB8bbvno/+0KShutFDUhQITXwnt/8dJKivZtbBY
	87dG+iHRJAkCYjBofLrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg4Ni-007mFt-8b; Thu, 28 Oct 2021 12:19:42 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg4Ne-007mFG-97
 for ath11k@lists.infradead.org; Thu, 28 Oct 2021 12:19:40 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635423579; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=xMeIdN2FZQff6DezX7QGHdbUz4JRZYLaaTuPo1KS7vo=;
 b=J6teRiasq6EIDXCtb9DRgqeVb8KxDAWGPrNGTs07W3ZUkTeGX6qHKBVrUYw6SzSaGwKzKR7N
 ToAxIO6czORm70kkLZqggLejmJkaMbgH2zAjaUmsYcpD8qO4ZTjK9aHGGTuh9sxFabIByf3u
 Y4YeNaQAUKgzp6spPYjQfLYaVYs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 617a9556c8c1b282a578c75f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 Oct 2021 12:19:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AAD67C4360C; Thu, 28 Oct 2021 12:19:34 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EA1DCC43460;
 Thu, 28 Oct 2021 12:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org EA1DCC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: mpubbise@codeaurora.org
Cc: Carl Huang <cjhuang@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, cjhuang=codeaurora.org@codeaurora.org
Subject: Re: [PATCH] ath11k: enable power save in station mode
References: <20211011190625.4463-1-cjhuang@codeaurora.org>
 <f4457c0027a70d996eb5930a334a9832@codeaurora.org>
Date: Thu, 28 Oct 2021 15:19:30 +0300
In-Reply-To: <f4457c0027a70d996eb5930a334a9832@codeaurora.org> (mpubbise's
 message of "Thu, 28 Oct 2021 10:53:34 +0530")
Message-ID: <87wnlx4a0d.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_051939_262357_1EF08F41 
X-CRM114-Status: GOOD (  13.54  )
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

mpubbise@codeaurora.org writes:

> On 2021-10-12 00:36, Carl Huang wrote:
>> Enable power save in station mode.
>>
>> Run "iw dev wls1 set power_save off",  check there is no NULL Data
>> frame
>> from sniffer. Run "iw dev wls1 set power_save on", check there is NULL
>> Data frame from sniffer.
>>
>> Tested-on: QCA6390 hw2.0 PCI
>> WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>>
>> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>

[...]

>> +int ath11k_wmi_set_psmode(struct ath11k *ar, u32 vdev_id,
>> +			  enum wmi_sta_ps_mode psmode)
>> +{
>> +	struct ath11k_pdev_wmi *wmi = ar->wmi;
>> +	struct wmi_sta_powersave_mode_cmd *cmd;
>> +	struct sk_buff *skb;
>> +	int ret;
>> +
>> +	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, sizeof(*cmd));
>> +	if (!skb)
>> +		return -ENOMEM;
>> +
>> +	cmd = (struct wmi_sta_powersave_mode_cmd *)skb->data;
>> +	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
>> +				     WMI_TAG_STA_POWERSAVE_MODE_CMD) |
>> +			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
>> +
>> +	cmd->vdev_id = vdev_id;
>> +	cmd->sta_ps_mode = psmode;
>> +
>> +	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
>> +		   "WMI set sta ps vdev_id %d ps %d\n",
>> +		   vdev_id, psmode);
>> +
>> +	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_STA_POWERSAVE_MODE_CMDID);
>> +	if (ret) {
>> +		ath11k_warn(ar->ab, "failed to send WMI_STA_POWERSAVE_PARAM_CMDID");
>> +		dev_kfree_skb(skb);
>> +	}
>> +
>> +	return ret;
>> +}
>
> An API which does this is already present in ATH11K, you may have to
> take a look at ath11k_wmi_pdev_set_ps_mode() ?

Good catch, I'll fix this in v2.

And please do trim your replies, quotes over 200 lines long make it hard
to read.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
