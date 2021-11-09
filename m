Return-Path: <SRS0=ve4P=P4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE27C433EF
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 09:59:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C995610A3
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 09:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C995610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4LfIPWT10kWpyFUWOASYRX45MyYPveGP4u/ei4M668=; b=SD3TNG1OdkHX2PCz37azQhKD7s
	f3N7oK1PuqvxFdgkrdwTN74GjA7Fs8gT3Rjlh8Xo344+dgsxxK4MXhqh/e8LNQXt7+/wB2N0H/6Hv
	uIPUxrM/zM+lP3w5UR/5EghcwrU3kJnzrr6HptukhwukJKANxJSEfYyS2VzFiQZsDcbq5E33hXPHw
	4eTZxK9QN03JEjlTrtu10Dez55u8+4kh62xXOFvgX43hk9RK3GKHYaIQN0Y+sGdnmAZnbHjg+F0Xt
	IzJWVA97TpV9xkT4f1ViHdGdrWZARyvXP7Bv36pNEpyZm+3mTkzlIuYh/ozcpTQZHY1yDdNWSbIW1
	J8tNAQWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNuX-001NU8-2Y; Tue, 09 Nov 2021 09:59:25 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNmp-001KZY-7h
 for ath11k@lists.infradead.org; Tue, 09 Nov 2021 09:51:32 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636451489; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=MmotNd5wfk0LxABbGhf1k4uc8MqGoHWhxl0N0+F4Wmk=;
 b=GRIpHfjNigmB7KJgy6ZMFGZk4R/U8crBGz/Q8A9TV6pnutPK6+18OtjGoGDMcYWEIwsamPgO
 N5W79FBLdx8qCKNB5HkZb/F2Mk+kRPULw4O+gwdDuiofI3bzKcQIG5rEKfztr3FZdwIOvKJc
 FeryQE/ez7xJl1YcAmKVBraPTPU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 618a4494a4b510b38fa679f7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Nov 2021 09:51:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CD819C4314D; Tue,  9 Nov 2021 09:51:15 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A69B6C4314B;
 Tue,  9 Nov 2021 09:51:13 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 09 Nov 2021 17:51:13 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH] ath11k: add string type to search board data in
 board-2.bin for WCN6855
In-Reply-To: <87mtmepz3z.fsf@codeaurora.org>
References: <20210913181131.194024-1-jouni@codeaurora.org>
 <87mtmepz3z.fsf@codeaurora.org>
Message-ID: <802a09c8fb8f284a2961f229353b9590@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_015130_095133_39CE2A99 
X-CRM114-Status: GOOD (  16.36  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-11-08 21:15, Kalle Valo wrote:
> Jouni Malinen <jouni@codeaurora.org> writes:
...
>> +	switch (ab->id.bdf_search) {
>> +	case ATH11K_BDF_SEARCH_BUS_AND_BOARD:
>> +		scnprintf(name, name_len,
>> +			  
>> "bus=%s,vendor=%04x,device=%04x,subsystem-vendor=%04x,subsystem-device=%04x,qmi-chip-id=%d,qmi-board-id=%d%s",
>> +			  ath11k_bus_str(ab->hif.bus),
>> +			  ab->id.vendor, ab->id.device,
>> +			  ab->id.subsystem_vendor,
>> +			  ab->id.subsystem_device,
>> +			  FIELD_GET(ATH11K_CHIP_ID_MASK, ab->qmi.target.chip_id),
>> +			  ab->qmi.target.board_id & 0xFF,
> 
> Why are chip_id and board_id masked? Why cannot we use values directly
> provided by the firmware?
> 
below is the log for WCN6855 2.0, its chip_id is 0x2 and board_id is 
0x106, but actually we need to
find the board data with chip-id=0 and board-id=6, so we add mask here.

[ 3000.176621] ath11k_pci 0000:05:00.0: chip_id 0x2 chip_family 0xb 
board_id 0x106 soc_id 0x400c0200
[ 3000.182361] ath11k_pci 0000:05:00.0: boot using board name 
'bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=3374,qmi-chip-id=0,qmi-board-id=6'

> And if we need to mask those, it's better to do them in qmi.c where 
> they
> are stored:
> 
Currenly logic of default: in ath11k_core_create_board_name() which is 
introduced in 1st commit
also use the chip_id and board_id, if mask them in qmi.c may effect the 
logic of ath11k_core_create_board_name().

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/drivers/net/wireless/ath/ath11k?h=ath-next&id=d5c65159f2895379e11ca13f62feabe93278985d
ath11k: driver for Qualcomm IEEE 802.11ax devices
+static int ath11k_core_create_board_name(struct ath11k_base *ab, char 
*name,
+					 size_t name_len)
+{
+	/* Note: bus is fixed to ahb. When other bus type supported,
+	 * make it to dynamic.
+	 */
+	scnprintf(name, name_len,
+		  "bus=ahb,qmi-chip-id=%d,qmi-board-id=%d",
+		  ab->qmi.target.chip_id,
+		  ab->qmi.target.board_id);
+
+	ath11k_dbg(ab, ATH11K_DBG_BOOT, "boot using board name '%s'\n", name);
+
+	return 0;
+}

another thing is that, other bits of chip_id/board_id maybe also need 
used by other place/feature, so we still need to
store the total original value of chip_id/board_id instead of mask it 
only for board data file.
Then user can easily get their own mask from chip_id/board_id.

> 	if (resp.chip_info_valid) {
> 		ab->qmi.target.chip_id = resp.chip_info.chip_id;
> 		ab->qmi.target.chip_family = resp.chip_info.chip_family;
> 	}
> 
> 	if (resp.board_info_valid)
> 		ab->qmi.target.board_id = resp.board_info.board_id;
> 	else
> 		ab->qmi.target.board_id = 0xFF;



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
