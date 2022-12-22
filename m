Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E93C4332F
	for <ath11k@archiver.kernel.org>; Thu, 22 Dec 2022 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FdQR4HMNuDGCFepVz1h7gdILbBMtpRd/F+bfs9N2CaA=; b=tluE7bjnoWDO9S
	z79jiwy/qgChEpczHXPvaPCvOuZVbgn7LCyUzGKuoF9N5OiuwayrwcAiHZvaucFiH/eUARipJ5ta4
	2c9D1ryCmflVcBMwU2xv0WA1vXhwdRQb5YC9uyTTRhg7Kel0yq4DRFkofdkBYcM88L2ymnh0Y9Qnk
	CHzzI6rc6m9tOYJgqSCaFWzyTvc0dOpIoPJpDx+GsT4IOza74reNpmIkE8P0XyyGJqrn7S/Y0bOSq
	T9UNRy+EtAEFFhEhkx0N8Madu4GX7KSeSRkwRlcki9P6epNjlriuv9FHRX6W/zfhz1ipPgb3EgUOW
	VFLpWlEbXNQ8rsJvm4+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8MIm-00CoiL-M7; Thu, 22 Dec 2022 14:12:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8M4r-00Cfqr-5E
	for ath11k@lists.infradead.org; Thu, 22 Dec 2022 13:57:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B0CDCB81D9F;
	Thu, 22 Dec 2022 13:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 762F8C433D2;
	Thu, 22 Dec 2022 13:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671717458;
	bh=m4BhhoLs0SHSKY2sSWcAGIJSCilLlLfjaBNVjEGhwrk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=H0HmuXkswh4X+/si5WMZLDgC3liPMt970G+q2tQfnquI1pj+PPHnfQnODoFI7O6BU
	 vCqid/QYSGzhb5O4oBz/AQveVeGK9eksEAtP5VacivcbqkBq1c+pG5JpGGI9ANkqyO
	 Y/IVN9xYYunIt4P3S762X4yYZWCSoSCp5zOG9gXJAOBryZFrijM1ko6OTgSZEvZ0IK
	 lXc4OorgtqD2fpkZaL15nj2mJXViNFK15QfrDiEUkO5IBN/MWhtoyd4NxoUw9ZRrFM
	 OtqSElmmHoJ+oMFQVvATKrv0ym1/OI9G/C8TVgxE8bTAJWRmUYwVOGmdxpBlxWqeSc
	 jvSalIjQT65Cw==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: Manivannan Sadhasivam <mani@kernel.org>,  Robert Marko <robimarko@gmail.com>,  davem@davemloft.net,  edumazet@google.com,  kuba@kernel.org,  pabeni@redhat.com,  gregkh@linuxfoundation.org,  elder@linaro.org,  hemantk@codeaurora.org,  quic_jhugo@quicinc.com,  quic_qianyu@quicinc.com,  bbhatt@codeaurora.org,  mhi@lists.linux.dev,  linux-arm-msm@vger.kernel.org,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  ansuelsmth@gmail.com
Subject: Re: [PATCH 2/2] wifi: ath11k: use unique QRTR instance ID
References: <20221105194943.826847-1-robimarko@gmail.com>
	<20221105194943.826847-2-robimarko@gmail.com>
	<20221107174727.GA7535@thinkpad> <87cz9xcqbd.fsf@kernel.org>
	<877czn8c2n.fsf@kernel.org>
	<CA+HBbNFCFtJwzN=6SCsWnDmAjPkmxE4guH1RrLc+-HByLcVVXA@mail.gmail.com>
Date: Thu, 22 Dec 2022 15:57:32 +0200
In-Reply-To: <CA+HBbNFCFtJwzN=6SCsWnDmAjPkmxE4guH1RrLc+-HByLcVVXA@mail.gmail.com>
	(Robert Marko's message of "Wed, 14 Dec 2022 13:02:42 +0100")
Message-ID: <87k02jzgkz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_055741_574266_0EF1BC08 
X-CRM114-Status: GOOD (  23.26  )
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

> On Tue, Nov 22, 2022 at 12:26 PM Kalle Valo <kvalo@kernel.org> wrote:
>
>>
>> Kalle Valo <kvalo@kernel.org> writes:
>>
>> > Manivannan Sadhasivam <mani@kernel.org> writes:
>> >
>> >> On Sat, Nov 05, 2022 at 08:49:43PM +0100, Robert Marko wrote:
>> >>> Currently, trying to use AHB + PCI/MHI cards or multiple PCI/MHI cards
>> >>> will cause a clash in the QRTR instance node ID and prevent the driver
>> >>> from talking via QMI to the card and thus initializing it with:
>> >>> [    9.836329] ath11k c000000.wifi: host capability request failed: 1 90
>> >>> [    9.842047] ath11k c000000.wifi: failed to send qmi host cap: -22
>> >>>
>> >>
>> >> There is still an outstanding issue where you cannot connect two WLAN modules
>> >> with same node id.
>> >>
>> >>> So, in order to allow for this combination of cards, especially AHB + PCI
>> >>> cards like IPQ8074 + QCN9074 (Used by me and tested on) set the desired
>> >>> QRTR instance ID offset by calculating a unique one based on PCI domain
>> >>> and bus ID-s and writing it to bits 7-0 of BHI_ERRDBG2 MHI register by
>> >>> using the SBL state callback that is added as part of the series.
>> >>> We also have to make sure that new QRTR offset is added on top of the
>> >>> default QRTR instance ID-s that are currently used in the driver.
>> >>>
>> >>
>> >> Register BHI_ERRDBG2 is listed as Read only from Host as per the BHI spec.
>> >> So I'm not sure if this solution is going to work on all ath11k supported
>> >> chipsets.
>> >>
>> >> Kalle, can you confirm?
>> >
>> > I can't look at this in detail right now, but hopefully in few days.
>> > I'll get back to you.
>>
>> The solution we have been thinking internally would not use
>> MHI_CB_EE_SBL_MODE at all, it's not clear for me yet why the mode was
>> not needed in our solution. Maybe there are firmware modifications? I
>> think it's best that we submit our proposal as well, then we can then
>> compare implementations and see what is the best course of action.
>
> Kalle, any ETA when you will post your idea? I am constantly hitting
> this crazy limitation and my idea does not work on cards like QCA6390
> so it's not a viable workaround at all.

Really sorry, I just didn't manage to get this finalised due to other
stuff and now I'm leaving for a two week vacation :(

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
