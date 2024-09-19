Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BBDCF3963
	for <ath11k@archiver.kernel.org>; Thu, 19 Sep 2024 19:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AEKAY1fV01EqWFMerL06owwH98kKOIUb2OCtA2k5J+s=; b=glB4VpaBDQmgJoB2LBSrd43o9c
	sG+XrotjXFg53cRmWs+GiDrtaliOIj9YO91jrZYW6kToEiFPYfFKZd8OBsR68Yb/Jvyox33zl07kP
	5E6womoUuVRJMGIR8wZpphyEOOzc96VYciqtg4AxuwekYpTT8IdonWTiS098uMf2VE8KJ0I0ZsZz+
	TsKP2Uz6XDjArn0Ba0RLty56FyXkkdkjfoZbVwuMbBottB8qN2eYgkOkm/n5m9YYuQtw8qokVjfDF
	en1ub7REDqvlTGDjGhGMIwwya3lOgb5ambr9EBHr43pFwJds20YUaFKhQrBAjNypwKCjvBbswNtv5
	zfvXobFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srN8r-0000000Avt1-13G4;
	Thu, 19 Sep 2024 19:48:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srN8o-0000000Avsc-2Pcc
	for ath11k@lists.infradead.org;
	Thu, 19 Sep 2024 19:48:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9AD2F5C593B;
	Thu, 19 Sep 2024 19:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FB2C4CEC4;
	Thu, 19 Sep 2024 19:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726775317;
	bh=cglVa2inwgOVL4Sj7zocIVqvJ4rKwOX/A+cKT+kSPH8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=W8IfyXPI0tiZ7wknMmNGaSVn5ItYfBsBsC1VyCX0a1ZL4yELyqF9K9dEJgVyt0Mgy
	 1hGOwuH3+kZVUCTfAkKr3ol+eNsrA7qMPTwhmztDW1bjo+IGDvJ5XrQPIYKqyBNf03
	 CZliANI8z/KU/Eb21xs+gJXf5qqfQ3oLAVP7BWLHGoQphN/a/GSUlvl4N9T6myYeSj
	 BoiHxY+RfsQBNJH0Fay+86dilY80X1RM8huPkOCX+LOgslduCYt8BYTbpleFVfsYIh
	 efkttbpC6XcKN/vjIzzMggyow3NBxwF7LOJdrTp1YrnNbOe1begK16qEAo6LUL7qOY
	 8Xl6EXTjThPeA==
From: Kalle Valo <kvalo@kernel.org>
To: Drew G <gottagit@pm.me>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: Missing hw2.1 symlink for WCN6855 in the kernel.org
 linux-firmware repo.
References: <Wfrop8a7fA9t_i7gKRGWjgRBFd5f33ZojAUWrpnEEj6lhw0ciTgw6uOgXSGBR79ni2LaRvKMnU0FgPRxLum6jlssu-M71_67G1s1afnlmPs=@pm.me>
Date: Thu, 19 Sep 2024 22:48:34 +0300
In-Reply-To: <Wfrop8a7fA9t_i7gKRGWjgRBFd5f33ZojAUWrpnEEj6lhw0ciTgw6uOgXSGBR79ni2LaRvKMnU0FgPRxLum6jlssu-M71_67G1s1afnlmPs=@pm.me>
	(Drew G.'s message of "Thu, 19 Sep 2024 18:54:45 +0000")
Message-ID: <87o74jbf1p.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_124838_700237_85E58923 
X-CRM114-Status: UNSURE (   9.73  )
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

Drew G <gottagit@pm.me> writes:

> This simple symlink was added over 2 years ago but still hasn't made
> it into the upstream linux-firmware.git in kernel.org? What is the
> process to make this happen as it means WiFi is broken for people who
> use regularly update from the kernel.org repo? How often are these
> upstream files updated with the latest blobs in this codelinaro repo?
> Thanks
>
> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/commit/c90fbaf6224b73aaebd523e102fe7c78f6a542ad

In linux-firmware the links are created from WHENCE file:

Link: ath11k/WCN6855/hw2.1/regdb.bin -> ../hw2.0/regdb.bin
Link: ath11k/WCN6855/hw2.1/board-2.bin -> ../hw2.0/board-2.bin
Link: ath11k/WCN6855/hw2.1/amss.bin -> ../hw2.0/amss.bin
Link: ath11k/WCN6855/hw2.1/m3.bin -> ../hw2.0/m3.bin

So when you do 'make install' it should create the symlinks.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

