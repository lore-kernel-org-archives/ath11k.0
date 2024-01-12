Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352CFC4725D
	for <ath11k@archiver.kernel.org>; Fri, 12 Jan 2024 15:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YyetyWeG9UbSbOOnqmlTvkeIXgj/ry23oApekZQV2l8=; b=GK6z9uwKhs0LI7gMDOGt0RJm+U
	45Ptw+IOfoz+lgBphuAKZuUzgDMdtNJkUWRzfjKCaxLMgv6558raW5jJuc57wHU6TaYgxczUSQ86b
	T8z0eiQ7glfjbDkkKyFPdgNdzT9N6jOmTNwvJVTT7o7OoxD1Yfw9TxEJhbBGBkSWTQ5735bdPckqj
	RuqcBfgqO/bBFfzBjI1ylJ6XJ/Z7+Tauhel369RyYtovMrrR71AVINdRvdMEKkYds6HQXaD1wH8qw
	K/81ciRBVjO7L5Btx8cV8lW46wbuJAYx6yY+1w0k1XDU80231UuuE5sJtTEcAnF9DJPqaGtHsI+Ch
	HXyhAEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOJkN-003COa-13;
	Fri, 12 Jan 2024 15:47:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOJkK-003CNs-2P
	for ath11k@lists.infradead.org;
	Fri, 12 Jan 2024 15:47:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id AEEA7B8233D;
	Fri, 12 Jan 2024 15:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E299DC433C7;
	Fri, 12 Jan 2024 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705074418;
	bh=igEeV4GkCvqUGqVrM5kh4M1lITRFNUlb7FBFynlbMJI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=vH+Z0++EVXTiW4epCVxhtxdJs+02tksp8zU2XTP0lVUM+7dwVMaPRoFGK9bV1f4pS
	 +7EReTkt3uUeBzy/xb6pVn3s/bUGc6H0lwv85TBKkTz+24vfvkmEYZxgDPH/h0zXcE
	 JhD4rDZiU/BIliE6VkcNmKDPhOyXo/H/KiubJ0VLPmxsicyOWtxXcEIl1J6KwAzZAu
	 ivHp0Nz3FHx2HUtOAFZz871gEMF4CtSzz6mB32/+1ZiEbWaxGP7hLqGH+L0nKdVyC3
	 rcgt+ZHKtUr0UBKjuBIn52LXVyDhuCDxe2OTGmFxNOBShUsv9IFpYTVZnePHRgRv6G
	 vXlfRiJLsFlEw==
From: Kalle Valo <kvalo@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  Baochen Qiang
 <quic_bqiang@quicinc.com>,  ath11k@lists.infradead.org,
  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 2/2] wifi: ath11k: add support for QCA2066
In-Reply-To: <20240112-dangerous-cow-of-excitement-fdbaa6@lemur> (Konstantin
	Ryabitsev's message of "Fri, 12 Jan 2024 09:38:22 -0500")
References: <20240109021336.4143-1-quic_bqiang@quicinc.com>
	<20240109021336.4143-3-quic_bqiang@quicinc.com>
	<e19baf59-c17b-4e2b-96d7-f4fc9812c99a@quicinc.com>
	<56282bad-b59d-4572-a6f1-1b905bf0edbd@quicinc.com>
	<da6ff953-07a4-4226-a7dc-b816f8dc5724@quicinc.com>
	<20240112-dangerous-cow-of-excitement-fdbaa6@lemur>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 12 Jan 2024 17:46:54 +0200
Message-ID: <874jfia70x.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_074700_955292_CF157119 
X-CRM114-Status: UNSURE (   8.91  )
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

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Wed, Jan 10, 2024 at 08:20:46AM -0800, Jeff Johnson wrote:
>> Unfortunately automated tasks don't parse cover letters. But it looks
>> like b4 doesn't handle or warn about:
>> prerequisite-patch-id: 640366721125b1adea0eeabd5cdfca5e91476e7c
>> 
>> And not quite sure how it would handle that.
>
> B4 should be able to handle dependencies like that in the future. For example,
> we can already locate this patch using:
>
> https://lore.kernel.org/all/?q=patchid%3A640366721125b1adea0eeabd5cdfca5e91476e7c

Oh, that is a very useful feature. Thank you.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

