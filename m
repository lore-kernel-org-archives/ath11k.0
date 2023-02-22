Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BC6C61DA4
	for <ath11k@archiver.kernel.org>; Wed, 22 Feb 2023 10:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1jM2WJioJ+tGG6omGewqCewmPzmXl9PLdiPBEFqIbs=; b=uOjI2D9XVDEff1
	X3UbFDI1bMnZluSy/35Zbqi4FVqYC869zgOdV5gNhvltOJ+zA36tG6aOKlqAWIrA5yVarJMsfhVXF
	TAkWCiUhOZX7L9V7Ty3EcEG1jnyahJklhr8PivAOAqNKJRY0x66EX4jjc4t62DCrW+Rr//HnkpGQx
	M3VNC5A+YlWDVkr0JqnV7yjjJrXvv1gsFES1/hc5CK06Gr9yDroXxwpiTWRGZmu1PPGnzo3L07CId
	9o3KkE6Jqz2PogYbptBJusg2timo+Lss5NTJTJCs+tuGTsMc0TFyvWDZ396qRXHxn/4MvX6Cra1eG
	8Hp8mZIxkirqzo6C5DvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmTD-00Byja-Ra; Wed, 22 Feb 2023 10:35:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUm2A-00BlBF-DZ
	for ath11k@lists.infradead.org; Wed, 22 Feb 2023 10:07:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E0DF46124F;
	Wed, 22 Feb 2023 10:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39269C433EF;
	Wed, 22 Feb 2023 10:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677060453;
	bh=UQvctXk/GLWwF1i1WLEHlMRX57m9FXDXBJWODixJVXM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=LStlCqseFqHzo7ep3cx14uhZ6oJcIRoj9O15AUv5oqgnmERcIb7n+QtI0tloQntU/
	 PVyUhvJXT3mJ9sOOV5ZeS467VW020RjWHspw/PzksWb5fft749RM06t6FOiNll27Ww
	 mioIw5BVSh3ZdFimuVgJ6xNp/trBja+olvIEVz42kYOeezDBZ1t68D/NMJColEpJPM
	 wtS5149nGSybPRxbvkfRxUNCy/mF3C04BVp2a9iWkPOfFHN7oABGjxtoLKspHZgY4l
	 7KSmF4gieBCBTqRj1yVfYb1lZqYhE9at+aKzczj2T8mKRsUVFkKMUnBrTts/5Wnbcr
	 wNZ4X/2zRdpzA==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,  Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] wifi: ath11k: fix SAC bug on peer addition with sta band migration
References: <20230209222622.1751-1-ansuelsmth@gmail.com>
	<167688346963.21606.5485334408823363188.kvalo@kernel.org>
	<63f3c697.5d0a0220.8f9f5.c859@mx.google.com>
Date: Wed, 22 Feb 2023 12:07:29 +0200
In-Reply-To: <63f3c697.5d0a0220.8f9f5.c859@mx.google.com> (Christian Marangi's
	message of "Mon, 20 Feb 2023 14:51:05 +0100")
Message-ID: <874jret3mm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_020734_529715_D2EBD49D 
X-CRM114-Status: GOOD (  16.43  )
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

Christian Marangi <ansuelsmth@gmail.com> writes:

> On Mon, Feb 20, 2023 at 08:57:51AM +0000, Kalle Valo wrote:
>> Christian Marangi <ansuelsmth@gmail.com> wrote:
>> 
>> > Fix sleep in atomic context warning detected by Smatch static checker
>> > analyzer.
>> > 
>> > Following the locking pattern for peer_rhash_add lock tbl_mtx_lock mutex
>> > always even if sta is not transitioning to another band.
>> > This is peer_add function and a more secure locking should not cause
>> > performance regression.
>> > 
>> > Fixes: d673cb6fe6c0 ("wifi: ath11k: fix peer addition/deletion
>> > error on sta band migration")
>> > Reported-by: Dan Carpenter <error27@gmail.com>
>> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
>> > Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> 
>> I assume you only compile tested this and I'll add that to the commit log. It's
>> always good to know how the patch was tested.
>> 
>
> Hi, I just got time to test this and works correctly on my Xiaomi
> AX3600.
>
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1

Thanks, I'll add this to the commit log.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
