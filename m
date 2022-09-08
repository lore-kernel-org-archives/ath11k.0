Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59EAC38145
	for <ath11k@archiver.kernel.org>; Thu,  8 Sep 2022 06:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J1YVEC82qhOJxejZX2a8eG4UuTqMDUCaetY8xYVLTlI=; b=Tp+6WTApCfMGFy
	lptBCjpfKIAxFoz9ycs1/NLe9r3ay9xwRJqZvKmhmGrauFQIuvdOay7Utg61tjggw4Ss8Ruy4UYTx
	P9PYt6AtkTr/nq+QPcg40D/McI2THwhT8iisD112Ov3lv4RPlM1cu6f/Zdi/WtJmSTxVKUazfxbcO
	tiivfsKcnCYECN3ZjAdJXqd3Mri3wkbf50A1tTMAI7Vqw6IiDiMHWJ9HkMQ7H6aD2g/c6mYvsKuTy
	aIepD/8occBxqNvp6D4yhkwkaTz9cocQbKrcj3BCAdptsMDau7sL+rZudQfJ48pZbpxUJvsq0Vh59
	tduTYIiwQUOygGONfVSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBMn-00HYtf-30; Thu, 08 Sep 2022 06:50:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBMU-00HYlm-Q4
	for ath11k@lists.infradead.org; Thu, 08 Sep 2022 06:50:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4AE59B81FC0;
	Thu,  8 Sep 2022 06:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50322C433C1;
	Thu,  8 Sep 2022 06:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662619800;
	bh=U6BKQuMQPjPIj7UYLySFnwE0T6a7A1V+ksMafHOAoJU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=muP1SlBhmY5pUmbfoXIneJjuw8poFU6ghR9oW48duEe3t2B4DaxL0MLNG/i45S0pd
	 9+IuqYw7fyteKnPlAM2H36+KJ9zEAL0vEeu0DINHuPspqHQEU582sOFD0/d46VI+X2
	 D/0A2ldbF7FIBUgIcsrIXaTxP+yvpbMKY5sGeZyo1yHjfIX7WD0ajE2kZqMp8hMhzr
	 0uLgkscE32hFx0KZHymkyMu9MgtIKg6TQ4LlPbJ+UA08cakIdxDhzhTCRGa7za3dJM
	 0Zpb4keFxVF/FuHElwipPXsDuDbcVNcXPSQQoZv2fb4HblmEBQ2xZ5JT7hSuzbWS7u
	 xGJcvQ9vMJRyg==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/3] ath11k: Enable threaded NAPI on WCN6750
References: <20220720135113.15755-1-quic_mpubbise@quicinc.com>
	<20220720135113.15755-2-quic_mpubbise@quicinc.com>
	<87czceaqng.fsf@kernel.org>
	<dcc14883-51c9-c1bb-bbea-1b309eccedf2@quicinc.com>
Date: Thu, 08 Sep 2022 09:49:56 +0300
In-Reply-To: <dcc14883-51c9-c1bb-bbea-1b309eccedf2@quicinc.com> (Manikanta
	Pubbisetty's message of "Fri, 2 Sep 2022 18:47:41 +0530")
Message-ID: <874jxicqcr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_235007_023570_060AB3E2 
X-CRM114-Status: GOOD (  13.81  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

>> Also more testing would be nice. Enabling something like this with
>> testing only on one hardware family (WCN7850) can be risky. I always get
>> warm fuzzy feelings if a patch is tested with all three hardware
>> families we currently support:
>>
>> * IPQ8074 etc
>> * QCA6390 etc
>> * WCN7850
>
> WCN7850 should be an ath12k device If I'm correct.

Sorry, I meant WCN6855. Too many drivers and too many hardware...

> Regardless of the chip family, even I feel that the tput changes like
> these should be tested on all the chipsets. Availability of the
> hardware and time are something which are stopping me in testing the
> changes on all supported targets.

I have the same problem, I cannot test all possible hardware. That's why
I was requsting help here.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
