Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99334CD11C2
	for <ath11k@archiver.kernel.org>; Wed, 10 Apr 2024 07:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8Vh+inThCIEvdQwh8byrktTuMLZ674VGXJc3sjEhLk=; b=ZKpS0l6JIzh6ppTxwDtjy1hMW2
	c/RXlvXgScd/0FC8npUkh0BKm0spqXK5/f1DFBuUJMgYb/9kH3QoddUWfTEH2F0GWDWZ6X2dr1YCC
	sRSr8wJUkZntvM7NtBOS/N66dw4BWj39/YBdYr/R4nwR3tt+8KvfhR/kEArfAZojI9vfwLbkw6ayk
	oQ/UhVXyTQ1cj6BQ+qqIvbiWlJBG91DFQK5ge+COvrnyMzmxe0eumsQAME0QZznH5uwwNdh4zzTxn
	qe//C2sNdH8rD8terRkOUrjiPn+cIqAPKrMZGWN5Ju49s9LXFhpTr1ad/IXwCsxm4k5vItXfxUf1v
	HNixffPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSHA-00000005adb-0ONO;
	Wed, 10 Apr 2024 07:21:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSH7-00000005acU-0c0d
	for ath11k@lists.infradead.org;
	Wed, 10 Apr 2024 07:21:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4379A60C6C;
	Wed, 10 Apr 2024 07:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27369C433F1;
	Wed, 10 Apr 2024 07:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712733699;
	bh=uSO+u+i76hu3JFSP2eQ8xNE7qQlRpc9KE0wV5ZEsMpA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=o2eZh8LlewfFEFV9HSF/855Y36WPvFYpo5SB3vSffpC0HkUvrcv67je/qzpTyisX2
	 EENgwOwBE964tAteqLNsFAsdgBL4NaWO+rGrJ4mb9FbbG3o3GWI1pvO37JDsbc4wxw
	 UnCA78cfpYjQjLDJPTzcidw6mFErB59d2ClsHeD7Rli+uBmOGeDJ2Rt50R+reDIxOF
	 Med+sRHTpZimAGrknAXRrTLaCrlLWb9+nx0tzH7ajQ5/yqV0mzGpFlirwX1aODrtsc
	 cuFreVJnJQmxqVHudkUYc7tOYzyWB72EfMXl8LeXAX1zAc3ATCP7qDbEvzl0UTX4W3
	 e9QP2mDzxQ2eA==
From: Kalle Valo <kvalo@kernel.org>
To: Wren Turkal <wt@penguintechs.org>
Cc: ath11k@lists.infradead.org,  linux-bluetooth@vger.kernel.org
Subject: Re: QCA6390 bluetooth doesn't work after warm boot or disable/reenable
References: <a03dace1-ca0f-41d6-8e2c-636e3b053a3a@penguintechs.org>
	<31bb6e18-ecee-49b3-87d7-50ab53e07447@penguintechs.org>
	<1b3d3937-6679-491e-a5c6-818ae8ac639a@penguintechs.org>
	<87sezwjums.fsf@kernel.org>
	<99e404ee-81ca-4dcc-811f-9c55fc52c551@penguintechs.org>
Date: Wed, 10 Apr 2024 10:21:37 +0300
In-Reply-To: <99e404ee-81ca-4dcc-811f-9c55fc52c551@penguintechs.org> (Wren
	Turkal's message of "Mon, 8 Apr 2024 11:35:47 -0700")
Message-ID: <871q7d1y4e.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_002141_254736_4AA3BE07 
X-CRM114-Status: GOOD (  11.14  )
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

(please don't top post)

Wren Turkal <wt@penguintechs.org> writes:

> Thanks for letting me know. The wifi is working great. Thank you for
> your work on that.
>
> I doubt you will have time, but if you do have a chance to test it,
> that would be amazing. I would love to make sure that I am not the
> only person having this issue, if possible.

I don't use bluetooth for anything but I'll try to test it at some
point, though too busy to do it now. IIRC I had initially bluetooth
enabled on the kernel but later disabled it due to problems. It's so
long that I can't recall the details anymore.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

