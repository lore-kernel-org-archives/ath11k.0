Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FC4C433F5
	for <ath11k@archiver.kernel.org>; Mon, 30 May 2022 16:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FtUFrx4rueSBPgYHSxKHj+puOQDv20UrhPMiIbNO65k=; b=gWd/i+HlTICyWS
	gRcIJFofpDd+bEQMuOCVxCxllYYOC+OCdubBmeECZRFCCtRkwGxbqzKKMEA2UHOGGR2YSDXOthouR
	/N7RvZzyQcjsXlRHaaX7Ci8i6cFGcyyOvSod0rQlB3yHMygC3Ry+b99UZ02ezjV7mcCWYLQ8VmCJ2
	9YKLfqMsNKnbnk4UBYDAH8gF2nA61EjihNwbLuzYk8zyo2/dyRQlyZ9+aSz0yqwC8FPlIuN9Sop7h
	jGCa/mSWoMFpJAY93YJwqSv/JGqoxtbP3U/85BUgId47qG0E4ZNo0+o4PQssd5Cmo+Gvtg2lnq5dZ
	Qjc412SHfbbnlhdc4Ecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvi5N-007bdj-6n; Mon, 30 May 2022 16:17:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvi5J-007bdG-W6
	for ath11k@lists.infradead.org; Mon, 30 May 2022 16:17:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5A2C961158;
	Mon, 30 May 2022 16:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303EFC385B8;
	Mon, 30 May 2022 16:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653927456;
	bh=qHHh0cjImlR4BLowWXz8QANf5zqTuTKqGuIFNYJaDQk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=EkRjYI4wx3Xwo1F4EnuMiAy57LbGC/ZW71t6byocramqJRn7QK0edBSh/Of0yPh6q
	 X3rvwY/n/s0XfK6vfRQi9bdReq0il8JNiD29vkk9kPffzVy5dUxS3Wi1Q0vQfBzT+e
	 grEWXh60c1egVeCRjUPHVqLNuisxGGferLGuNmyjn250hijZzp0FbtPzjqRkbw2wWF
	 xSu8FbdP/fjkrjsxxFHHiwphisa0C4vBNb30PM+t3jkuxIPv1PXTBNxtu3zh+w5IHn
	 EBMrtG3DD2mIttVDh7IYvIrpLp7sd30hZ5hw2UQxywjb0/i9qNoO+JJn3HYqGyMp6L
	 gNmPOEkV1q8+Q==
From: Kalle Valo <kvalo@kernel.org>
To: Maxime Bizon <mbizon@freebox.fr>
Cc: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  devicetree@vger.kernel.org,  robh@kernel.org,  mka@chromium.org
Subject: Re: [PATCH v7 4/9] ath11k: Add register access logic for WCN6750
References: <20220429170502.20080-1-quic_mpubbise@quicinc.com>
	<20220429170502.20080-5-quic_mpubbise@quicinc.com>
	<bd6d97a4cc6665d0ee632444f75e3480160387ec.camel@freebox.fr>
	<c57e8791-b6ce-0752-52ca-a1cb938187d7@quicinc.com>
	<c1c3472427080716c69ad99ebe5d1954db44f03f.camel@freebox.fr>
Date: Mon, 30 May 2022 19:17:29 +0300
In-Reply-To: <c1c3472427080716c69ad99ebe5d1954db44f03f.camel@freebox.fr>
	(Maxime Bizon's message of "Mon, 30 May 2022 16:19:06 +0200")
Message-ID: <871qwbouzq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_091738_106043_830C722D 
X-CRM114-Status: GOOD (  12.83  )
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

Maxime Bizon <mbizon@freebox.fr> writes:

> On Thu, 2022-05-26 at 09:12 +0530, Manikanta Pubbisetty wrote:
>
>> 
>> Thanks for letting me know about this, IIRC I don't remember 
>> encountering this problem in my testing. Just for my understanding,
>> have you reverted this change and confirmed that these errors go away
>> ?
>
> I first confirmed the register location was indeed incorrect, then I
> fixed it like this:

Looks good to me. Can you submit that as a proper patch?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
