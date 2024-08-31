Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCBFCA101D
	for <ath11k@archiver.kernel.org>; Sat, 31 Aug 2024 09:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOkLimecnJVikuSESrt2pyRzPp2MkOdp/gpPqc+ydZ8=; b=L/4OcFikgZFwFzjslJe/+srQG/
	4ms2Y5cfeR1O10xbb8Chk6YD0vHoZEFyoAtiQUkLTH+EfdJzYprKokPtk43R+6Iamv9DQWDqQAC9i
	+ICKOE6lIIXsxhWjsJYCsjHesvSGEuBBulzuv8Z75Ttf94iL6dsXNEQHeak0hDxNAC9E2bPFKyfdo
	TpYH2zcpoon6b3osKcwHskAjfChdYkCBPdO5b0iKzl/p+hDne6HWyBptE4FzBPCJEm+OABNs2y1BQ
	I96OSTX0+AaoOiMBn+KNvYIzOXiOviOq86pgnjAnczuK0reJdYgLPfmzkSUkCz3fX4jTe2lzvWJXf
	TRK9nTlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skKa0-000000093DH-3IWU;
	Sat, 31 Aug 2024 09:39:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skKZy-000000093Ch-2sBc
	for ath11k@lists.infradead.org;
	Sat, 31 Aug 2024 09:39:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F2CAF5C0068;
	Sat, 31 Aug 2024 09:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F268C4CEC0;
	Sat, 31 Aug 2024 09:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725097173;
	bh=FI0gKYkPJkO4tP+tq0gaRf1Z+KPL1EhGoel9Ykvu2rg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=urJ325Y+X0yGXqiQiUH2N9pseEd6YrTRPGdR97q1RQ6nF5vMOimWXxC7fgkdJrlDm
	 B+PdHYkJUnWVEffEift0owri2DL5kJEHfGhCEJLjiWyad540O05mKBGXTLQFVQpdzi
	 lSTeg97BmVWuMremharL97XA+C/Mk44qnM1Po1ZOjeiLX5DABrIebpHsZeMR2YHOyG
	 4lJHAjndFS/Mu9WYOnGURM8vHYimb3NIxbro0QnJu3JqgNZIaCoJ8iQuNvn7piKD3/
	 vVvr7dDvy7/S7U8XQuBwB0KWiv3hWpXLY23uwevMM/5L4HjMAqPI/aCvixV4roY/bs
	 feTExTaDTJhkw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-current 2/2] Revert "wifi: ath11k: support hibernation"
References: <20240830073420.5790-1-quic_bqiang@quicinc.com>
	<20240830073420.5790-3-quic_bqiang@quicinc.com>
	<891d2bc3-9ace-4fed-92e3-192d8126c5c6@quicinc.com>
	<1e5c40f7-d8f4-4e62-af2d-216d6e02dd5b@quicinc.com>
Date: Sat, 31 Aug 2024 12:39:29 +0300
In-Reply-To: <1e5c40f7-d8f4-4e62-af2d-216d6e02dd5b@quicinc.com> (Jeff
	Johnson's message of "Fri, 30 Aug 2024 08:56:37 -0700")
Message-ID: <87plppkp4e.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240831_023934_812811_4C67DE51 
X-CRM114-Status: GOOD (  12.74  )
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

> On 8/30/2024 8:46 AM, Jeff Johnson wrote:
>> I think we need to add
>> Fixes: 166a490f59ac ("wifi: ath11k: support hibernation")
>> Cc: stable@vger.kernel.org # 6.10.x: <hash>: Revert "wifi: ath11k: restore
>> country code during resume"
>
> Re-reading https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1
>
> I see that I messed up the Cc tag(s)
> I think there should be two Cc's
>
> Cc: <stable@vger.kernel.org> # 6.10.x: <hash>: Revert "wifi: ath11k: restore country code during resume"
> Cc: <stable@vger.kernel.org> # 6.10.x

Adding that hash is tricky as then I need to first apply patch 1, edit
patch 2 and then apply patch 2. I did also consider adding cc stable to
the first to keep things simple. But let's try adding the hash anyway as
I have never done that.

I didn't add the first the cc stable tag yet, I'll do it after I have
applied patch 1. This is what's currently in pending:

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=d8535e2ae09212fbdd9330870814b62a231f8745

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html

