Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865BBC25B75
	for <ath11k@archiver.kernel.org>; Tue, 21 May 2024 11:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wg5OKdWG4ZwbFWd8Vn7ix+gmunXqptX/Drudv+N+jFM=; b=Njo3GK3/D39RzW4N/1p4l2bNhm
	qeQ+nftO3K14dFLISTwpgbYRRgOTINf7TvJ+HPkSDl7dTe++Ynil8Ue3+mZu7CYsCZ2SKV0Z9rwLJ
	6C2pyMuN/K6C1T9IP6eRSQD+LaJo1u9h3F7HZZJ3FEsLna7tHs7lu0v9bCdJydpTmxvKCd9QU/jeR
	Tudpj4qbKjiqPjpaOCOjJ1GTfwkM/sdPVWJStQc0YRR7I4p1d6vIX28MiDzsQcWeizQrUAm9fLoDV
	4k7xaFNbSP/0/XSXykJ0fKmmOA2j/HgMWVj9jRja51a+keaxmvD1oieoaBI1XnAMaYlEnG71+Lglo
	tGJXdAXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9NzS-0000000HKiI-0Eh6;
	Tue, 21 May 2024 11:49:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9NzO-0000000HKfS-3bYc
	for ath11k@lists.infradead.org;
	Tue, 21 May 2024 11:49:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4D2756221A;
	Tue, 21 May 2024 11:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DEA0C4AF14;
	Tue, 21 May 2024 11:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716292146;
	bh=TwjkO4RIn2h5ypR3QrQrEToUNfAlaecndvwSox/HHX8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=S7dXORILRhRMoATFEymHafhhoeUsKMMUVxyRUHGbsrdLI5LMLdy5cZRyEjPyRJdtx
	 TOjtoZuQofWEKum66hcP14B9RMNELZR3pWbtKlKKp6IhGDcZlp+6RlBm5ml2mQepBI
	 vflVLWx/PV6+W9zKUPC1tpglBnA19D1+z4UfiGjFz9cYrK5ddB+tCqg+FoWhOPBfuj
	 vctLrBpyz0kIa0GnxDb+voHV+jSdebNjzcylhqpFK0D9JhupaEeG4CvCnOqN2D9Css
	 GVqM8raPo4Rn/Jnbk0/ieWbn/mOO+1SWme/oSrGeje5hJ71cLdfqnOnojoM8od2Rku
	 NP8XaGXQTUtzg==
From: Kalle Valo <kvalo@kernel.org>
To: Matthew Schwartz <njtransit215@gmail.com>
Cc: ath11k@lists.infradead.org,  cristian.ciocaltea@collabora.com
Subject: Re: question regarding qca2066 and qca206x (Steam Deck
 OLED/Galileo) on upstream kernels
References: <CAFKu21ZKtKmf4Cze9JCRk750reKXxz+gMs+V1Dr8kUm-J1WWPg@mail.gmail.com>
	<87le44eqbl.fsf@kernel.org>
	<CAFKu21b_4fbP3Oku_CLBOYi7wfwmYWUXoG5H1gknvFit-wc4Rw@mail.gmail.com>
	<CAFKu21aQjbf_vsyikhQqDa0s99WQpzepLa0dWmmhVo5yeWr=Gg@mail.gmail.com>
Date: Tue, 21 May 2024 14:49:03 +0300
In-Reply-To: <CAFKu21aQjbf_vsyikhQqDa0s99WQpzepLa0dWmmhVo5yeWr=Gg@mail.gmail.com>
	(Matthew Schwartz's message of "Mon, 20 May 2024 13:52:02 -0700")
Message-ID: <87zfsjbd1s.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_044907_030106_DCAD1EA6 
X-CRM114-Status: GOOD (  14.77  )
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

Matthew Schwartz <njtransit215@gmail.com> writes:

>> Is the mismatch between file/directory structure for QCA2066 and the
>> upstream QCA206X I had to add to the upstream ath11k firmware going to
>> be an issue? Also, QCA206X seems to be missing Notice.txt. Will this
>> cause any issues?
>>
>
> Sorry there is a slight typo here. To clarify: Is the mismatch between
> file/directory structure for upstream QCA2066 and the Valve QCA206X an
> issue. I described the wrong folder as the upstream folder in my
> original reply.

So from what I have seen so far the situation seems to be this:

Steam has some ath11k hack patches to add QCA2066 support to an older
Linux kernel and they also have a separate firmware release. I do not
know where they got them from.

In Linux upstream ("kernel.org") we added initial QCA2066 support for
ath11k in Linux v6.9. We also provided the firmware[1] which will be
also submitted to linux-firmware.git in the near future.

The ath11k upstream version uses different directory structure as the
hack patches, which is not uncommon. Basically using hack patches is at
your own risk and no compatibility is guarenteed, of course. But once
the support is in official Linux kernel we take backwards compatibility
very seriously.

I want to also mention that even if Steam's ath11k firmware version
might work, I still recommend to use the firmware from our repo[1]. I do
not know what changes Steam's firmware version has and it possible might
be incompatible with kernel.org driver. In this mailing list we only
support firmware releases from [1].

[1] https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/tree/main/QCA2066/hw2.1?ref_type=heads

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

