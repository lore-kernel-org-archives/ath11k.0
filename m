Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BECC433F5
	for <ath11k@archiver.kernel.org>; Wed,  1 Jun 2022 06:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dx4yeaTlagxBpUBIzLYdvgO0DnzEiNlmEo4iEp8bH1A=; b=B7Jt/ZpVsxTam+
	dXBpB8MO0IT37sIa+ItE9CPeXG1v56M6jlvSOQ2g1R98vyZxvWxknzkcWX+1Kpd4jrhtzDonUk+nU
	4PZ83hV22O2BOEGG6u1OgLyXQOgt/R6Q0i9nh4n21MetWfVpHJL9/QIRB1fpV24zr9qM72WKeDNGz
	OMzF7U4reuMiostGPWm/iJ5PlhSh5ZuHXGMUxFGEWQCNKzf+auJU+kI9sYOSB22/7jP++z0rhi6Op
	akGQOlw3dXQ5Yu4yUkZim6+j6v7D4stC2/llXqr+gn7fa6ZoMqsuYqobM5Q98q95lbp9+NzUc2XZk
	kRmh5LLAM2d+6P4rNTpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwI5x-00ECFx-4R; Wed, 01 Jun 2022 06:44:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwI5s-00ECDV-Gf; Wed, 01 Jun 2022 06:44:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E2C0B612D6;
	Wed,  1 Jun 2022 06:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17349C385B8;
	Wed,  1 Jun 2022 06:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654065875;
	bh=N3F+OXVq3Yhd/7Eme7t9kj59sUbWEwsxF2ZOrdOStTQ=;
	h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
	b=uuYzfkKWYg/SxWBZw1qE92ktLf5qurc7vlkGMqU6ypRpDxxjPy8PPcbVhOKkS3+dp
	 wgYxqxodrG0H8laP1IngXj7J5MWZqD2ayn2Gwh/hjKEFFVw9DBexel4jlImFoXbp+b
	 8o2HBdVe3Xhv3LZHFJ+tqK6T3VrwCkfxDDR22kr7kDGs5qKYSZgeO4/U6un1NrN8g9
	 I+D1LSS48IWDy18B8HwDLlmLTaP9IpC3hgu+bJVCqfPWzNBDaBpDqANEYw97xUt7N3
	 E6w1eLKgCZUK7olqL2sP4bzxTKz1WMzLhp5Lmf4DpclaSG/YDx+EFWT0wmuPVjKdaw
	 GznDXxRYQaxBg==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "linux-firmware\@kernel.org" <linux-firmware@kernel.org>,  "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,  "ath10k\@lists.infradead.org" <ath10k@lists.infradead.org>,  "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20220423
References: <BYAPR02MB4567E377F14F272DFF48907A92FA9@BYAPR02MB4567.namprd02.prod.outlook.com>
	<332e62e5-b04d-3a6a-38fe-924d056bf0f8@linaro.org>
	<87k0b8fnpj.fsf@kernel.org>
	<CAA8EJpr3Uxa-Tif5TyHfXL03j1--vrAb+DgT=0DY8KDpvHPjeQ@mail.gmail.com>
Date: Wed, 01 Jun 2022 09:44:29 +0300
In-Reply-To: <CAA8EJpr3Uxa-Tif5TyHfXL03j1--vrAb+DgT=0DY8KDpvHPjeQ@mail.gmail.com>
	(Dmitry Baryshkov's message of "Fri, 29 Apr 2022 09:12:28 +0300")
Message-ID: <87r148opbm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_234436_635838_8EEF6B0F 
X-CRM114-Status: GOOD (  16.56  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On Fri, 29 Apr 2022 at 08:44, Kalle Valo <kvalo@kernel.org> wrote:
>>
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>>
>> > Hi Kalle,
>> >
>> > On 27/04/2022 11:32, Kalle Valo wrote:
>> >> Add support for QCN9074 and WCN6750 ath11k hardware families. Also
>> >> there are several updates to existing firmwares and board files for both ath10k
>> >> and ath11k.
>> >>
>> >> Please let me know if there are any problems.
>> >
>> > I noticed that this pull request doesn't include the board file for
>> > WCN3990. Is there any issue with it that we can solve on our side?
>>
>> Oh, sorry about that. I guess this is just a bug in my scripts, I'll
>> include the wcn3990 board file in the next pull request.
>
> Thank you! No problem, it was more of a question if we missed something.

It was pulled now:

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=86f0c5642c4c06583fccce8e03ca400300330cba

Do let me know if there's anything missing or wrong.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
