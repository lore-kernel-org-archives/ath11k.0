Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480FAC46467
	for <ath11k@archiver.kernel.org>; Wed, 11 Jan 2023 17:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/S+rWYRIutpgBo/KE+wPt9l3i0ydDjA5uQ2IhejnnNs=; b=H7CPzgAZsb8TIH
	tbNnx85aBo2202qvliHgCU57012LwFX1Sr18Hke4Gc2gN9hb46LnZuBg7olqoz6Yc1idWeq22n5je
	TIUVdpz0D0YUxwMuniLDoQ6/U2AuH37rOnckndxvP8hGen6eFF2+cjSKgTMFMAOQJCLkHXH5kcwuD
	dzRPQ5pk3TLCbZj1Wez2x6UhGh465vKLVPwZ6cHx7XL2ZgRQFMBW+RWKPaEKak5I8K/aUuSw0Y4wA
	cmpvAhaZfBzYHGXVxAQ0j09yEB+peYm9zHpHsHrdJyBD5k6QCm5N2PCitGG75vbPKlqYw2v8MA4x2
	b++QyjtG6er5DwwzMBiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFec3-00CK93-DN; Wed, 11 Jan 2023 17:10:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFebz-00CK7l-Td
	for ath11k@lists.infradead.org; Wed, 11 Jan 2023 17:10:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 948D7B81BDB;
	Wed, 11 Jan 2023 17:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69894C433D2;
	Wed, 11 Jan 2023 17:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673457001;
	bh=p719b2ISjyf+YPNA9dbKz3wlg67/k0ApyjDAH08j7Tk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=RvVPbRKYjaAAQ4+jbd4dhglkOO2KoEjbiPasXy+VT3UOECxvA+EUs0oHChpG7w+FN
	 tGllqFslZQFEea2+YyGnIhA8zOSYGPn2XlF3qwTH2X5AH6YVpVmSyr1uT6k35PwBQ2
	 LnrnRQVwM/Gi5XHb0JBd5bZy3soTHaXRpUr9NUwRRK2xfoycaVWCGpRV+YZeE3BAXB
	 UHtjeYT5+5OiwU2lP51va/W8N7W5cmeTJASFmwSjwtj8AxQReVIlnMnPxpQ4Bk7AGN
	 wtTfPxDuRCaP4+wh5lzL/tj5kGx3LYDQhz5aqxLxx0bhvzy9oYRCtCQqfxz2z8VCz0
	 vgg1FqSx2oscg==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: Manivannan Sadhasivam <mani@kernel.org>,  Robert Marko <robimarko@gmail.com>,  davem@davemloft.net,  edumazet@google.com,  kuba@kernel.org,  pabeni@redhat.com,  gregkh@linuxfoundation.org,  elder@linaro.org,  hemantk@codeaurora.org,  quic_jhugo@quicinc.com,  quic_qianyu@quicinc.com,  bbhatt@codeaurora.org,  mhi@lists.linux.dev,  linux-arm-msm@vger.kernel.org,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  ansuelsmth@gmail.com
Subject: Re: [PATCH 2/2] wifi: ath11k: use unique QRTR instance ID
References: <20221105194943.826847-1-robimarko@gmail.com>
	<20221105194943.826847-2-robimarko@gmail.com>
	<20221107174727.GA7535@thinkpad> <87cz9xcqbd.fsf@kernel.org>
	<877czn8c2n.fsf@kernel.org>
	<CA+HBbNFCFtJwzN=6SCsWnDmAjPkmxE4guH1RrLc+-HByLcVVXA@mail.gmail.com>
	<87k02jzgkz.fsf@kernel.org>
	<CA+HBbNHi0zTeV0DRmwLjZu+XzUQEZQNnSpBMeQeUPiBu3v-2BQ@mail.gmail.com>
Date: Wed, 11 Jan 2023 19:09:54 +0200
In-Reply-To: <CA+HBbNHi0zTeV0DRmwLjZu+XzUQEZQNnSpBMeQeUPiBu3v-2BQ@mail.gmail.com>
	(Robert Marko's message of "Wed, 11 Jan 2023 10:21:14 +0100")
Message-ID: <87358hyp3x.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_091004_124064_96DC6B0D 
X-CRM114-Status: GOOD (  10.88  )
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

Robert Marko <robert.marko@sartura.hr> writes:

>> Really sorry, I just didn't manage to get this finalised due to other
>> stuff and now I'm leaving for a two week vacation :(
>
> Any news regarding this, I have a PR for ipq807x support in OpenWrt
> and the current workaround for supporting AHB + PCI or multiple PCI
> cards is breaking cards like QCA6390 which are obviously really
> popular.

Sorry, came back only on Monday and trying to catch up slowly. But I
submitted the RFC now:

https://patchwork.kernel.org/project/linux-wireless/patch/20230111170033.32454-1-kvalo@kernel.org/

Please take a look and let me know what you think.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
