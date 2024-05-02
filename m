Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E8DC4345F
	for <ath11k@archiver.kernel.org>; Thu,  2 May 2024 07:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDpu/v5BhRmVQSLD5XLGf9qnt2E51a3xCiqDEHzZick=; b=bZTegqUjJPwAj+NeA9jgcYEnkC
	mabhQGwkrVB1b08H4xYBxc5xuEY9SqYPFLjeBwwlHUP/ls/mePbUbGzKda4c7DxffjidvUtTr5HxA
	OB73wpFg9Ovf0/ydH4+MKd1LDPl2+BiFqHWVyikpQy5JvclNDAKY8aZhuP1eFefR8nHAv+8HDDMP3
	cwOxyDwFAR78N1zoGgBSGm28HzimY5IRepfz65LGsFwFXOl8DgbNbbb7IilQqHfPr5jDhkj9HVVA0
	tg6V+APTuxXkbm5zHaBkiXED14eB4+b5VjCzJgwGY9zVKKpRoxPGq7/zodEbjnpLrkAZ5QQVkWk/5
	Mvs/g8yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2QTU-0000000BjeE-3ZSG;
	Thu, 02 May 2024 07:03:24 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2QTS-0000000Bjct-0uUA
	for ath11k@lists.infradead.org;
	Thu, 02 May 2024 07:03:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 63466CE13A0;
	Thu,  2 May 2024 07:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44ECDC116B1;
	Thu,  2 May 2024 07:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714633395;
	bh=eZHA6dycMEhndlQBEwkVSIH+8uMnPz6SrubKX8jZyiM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=JVuQzr6mEr/MJO50qsI7l1mXlXYnodA4CvgsULnCDa8KchLuwMW0knDcr7zxRRMVE
	 I0AdOqI6zxy5MRAipH9IBl/MBaISNGUCeTA63HmRKY/6CCpT5g+cVlcQuQUCO8Gmg5
	 WHSO/CCH39RqdORWIOtWc90DbXVgun3Q87Ta9Y8HJjzFItcJgHK4SdkhexVaFxiT9S
	 Wz80Srs9r1WaaZODKHlFMfZxeG22a0/W5jI66C/l1mY+QA9bVl6UTDV6nas/8lwK8O
	 whcGVM+cId3hrxY8/fxC+4BDGiIp90d9ukPRLrDQuubzmpBfOIkAEUHabFz9Q2Txwp
	 I865jPQt9MpLw==
From: Kalle Valo <kvalo@kernel.org>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Ziyang Huang <hzyitc@outlook.com>,  jjohnson@kernel.org,
  linux-wireless@vger.kernel.org,  ath11k@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: fix remapped ce accessing issue on 64bit OS
References: <TYZPR01MB55563B3A689D54D18179E5B4C9192@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
	<22b0713e-49f2-482a-b145-e460b5632a7c@lwfinger.net>
Date: Thu, 02 May 2024 10:03:12 +0300
In-Reply-To: <22b0713e-49f2-482a-b145-e460b5632a7c@lwfinger.net> (Larry
	Finger's message of "Wed, 1 May 2024 11:55:08 -0500")
Message-ID: <874jbgg0gf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_000322_545738_547DA92D 
X-CRM114-Status: GOOD (  19.05  )
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

Larry Finger <Larry.Finger@lwfinger.net> writes:

> On 5/1/24 11:14 AM, Ziyang Huang wrote:
>
>> On 64bit OS, when ab->mem_ce is lower than or 4G far away from ab->mem,
>> u32 is not enough to store the offsets, which makes ath11k_ahb_read32()
>> and ath11k_ahb_write32() access incorrect address and causes Data Abort
>> Exception.
>> Let's use the high bits of offsets to decide where to access, which
>> is
>> similar as ath11k_pci_get_window_start() done. In the future, we can merge
>> these functions for unified regs accessing.
>> Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
>> ---
>>   drivers/net/wireless/ath/ath11k/ahb.c | 34 ++++++++++++++++++++-------
>>   drivers/net/wireless/ath/ath11k/hal.c | 17 +++++---------
>>   drivers/net/wireless/ath/ath11k/hw.c  | 14 +++++------
>>   drivers/net/wireless/ath/ath11k/hw.h  |  7 +++++-
>>   4 files changed, 45 insertions(+), 27 deletions(-)
>> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c
>> b/drivers/net/wireless/ath/ath11k/ahb.c
>> index 7c0a23517949..9e59b4de93a9 100644
>> --- a/drivers/net/wireless/ath/ath11k/ahb.c
>> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
>> @@ -198,12 +198,30 @@ static const struct ath11k_pci_ops ath11k_ahb_pci_ops_wcn6750 = {
>>     static inline u32 ath11k_ahb_read32(struct ath11k_base *ab, u32
>> offset)
>>   {
>> -	return ioread32(ab->mem + offset);
>> +	switch (offset & ATH11K_REG_TYPE_MASK) {
>> +	case ATH11K_REG_TYPE_NORMAL:
>> +		return ioread32(ab->mem + FIELD_GET(ATH11K_REG_OFFSET_MASK, offset));
>> +	case ATH11K_REG_TYPE_CE:
>> +		return ioread32(ab->mem_ce + FIELD_GET(ATH11K_REG_OFFSET_MASK, offset));
>> +	default:
>> +		BUG();
>
> Do you really want to crash the system here? A dev_warn() or something
> similar would log the situation. I suspect this case is never taken,
> but a system crash is not a good response if it is.

Correct, BUG() is more or less banned from all wireless code.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

