Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0130C25B10
	for <ath11k@archiver.kernel.org>; Thu,  2 May 2024 07:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZNVlNvJLDH4dzhZVNxCUIK/u/XXde2l+sjFkINRI20=; b=Pxc5etVj+DxvfFXAOP9FES5NHL
	oThW7egrqZaU4JFTlXqtPOfVCf2O53eVlfctiJkzsoFDxaq7HRL+xGZJndMoV284f5unMyC4hIz/L
	SfVLHYrbOaf8Ug6vBuSWaqngF1Beo4lRiuCjy2AH3+2zofwN62Fs81CEpbXxPhAd3fu2xIEI1gV1x
	qLqXJBNHHl3asZiZvO4NxPHKeDbpaVjtWjt9fvTT0PVNp2BDcmD1WXvCQDv2IKeYReGGJejFACg40
	Clm3NiBFUOaKD/GZitWmGJi5E27P+u7SUcMffyur9YQAHifdBiEwp1jBezkpbpU5w4td4XBaHW91M
	6XSuaNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2QVk-0000000Bk9M-1zWh;
	Thu, 02 May 2024 07:05:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2QVh-0000000Bk7P-2xt1
	for ath11k@lists.infradead.org;
	Thu, 02 May 2024 07:05:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0BEFB610E7;
	Thu,  2 May 2024 07:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CB4C116B1;
	Thu,  2 May 2024 07:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714633540;
	bh=qohn0+wgZK8fW1L5cozppymgAyY5UyPVH1hNxyFm7eU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=oRqGX9FxmLIFyp9Bj3JGwc+u09C7EFFuKGwAASNv4wI1ZecH8gJiEifMEwVgOmiyX
	 3ukJLI8BFq4b5Bm/t6P2NyP3eFpDt1ymuOO1Q1Ti9QuFKuNnM+Zt6ShK3WDBtUBhdH
	 JqCy1IprTP8X+NzlXZRb97dGg6iZZgD7fbqxlpwe9rilg43LBzPtoJrgq/ohjORFhS
	 A6wrkUXcbDN3+OWOo2boPlvWB8+RBeSI39lHsDcsvCsXbnPKnh57RL/Oon7OZAofAc
	 pl1tOc6XriZ1t6L5TtbjxGoerBIckRM8/KxWvpbaiiHcWhV8OIKJoDpkXsK6Dgw0Z1
	 I917sxhoe5jNA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Ziyang Huang <hzyitc@outlook.com>,  <jjohnson@kernel.org>,
  <linux-wireless@vger.kernel.org>,  <ath11k@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: fix remapped ce accessing issue on 64bit OS
References: <TYZPR01MB55563B3A689D54D18179E5B4C9192@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
	<6336ffc7-d8ae-4cfd-8b66-d6d91cb0d15e@quicinc.com>
Date: Thu, 02 May 2024 10:05:37 +0300
In-Reply-To: <6336ffc7-d8ae-4cfd-8b66-d6d91cb0d15e@quicinc.com> (Jeff
	Johnson's message of "Wed, 1 May 2024 09:56:15 -0700")
Message-ID: <87zft8elry.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_000541_823764_B2C9A9F6 
X-CRM114-Status: UNSURE (   7.46  )
X-CRM114-Notice: Please train this message.
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

>>  static inline u32 ath11k_ahb_read32(struct ath11k_base *ab, u32 offset)
>>  {
>> -	return ioread32(ab->mem + offset);
>> +	switch (offset & ATH11K_REG_TYPE_MASK) {
>> +	case ATH11K_REG_TYPE_NORMAL:
>> +		return ioread32(ab->mem + FIELD_GET(ATH11K_REG_OFFSET_MASK, offset));
>> +	case ATH11K_REG_TYPE_CE:
>> +		return ioread32(ab->mem_ce + FIELD_GET(ATH11K_REG_OFFSET_MASK, offset));
>> +	default:
>> +		BUG();
>
> you can WARN but you can't BUG (and even WARN is being discouraged)

Yeah, even WARN() is risky especially in a function like this. It can
cause so much log messages so that the wathdog can trigger and reboot
the host.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

