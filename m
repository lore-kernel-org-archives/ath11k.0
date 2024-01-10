Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CA4C4707B
	for <ath11k@archiver.kernel.org>; Wed, 10 Jan 2024 13:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZUalg6vfjH7k+yK15tc0Ll5xilQLwN79QB04V0K4c0=; b=N6S1tBolpd4T90pBFtv0WYSLKR
	NPQ3/m7GzBD9+Nvpj+MYTj2vwY/wGsxKNqXCja/DLGqLYyjW03W0LFGPpP7xaVrpWUO/WCmDJGwZ5
	dEeRo6y/GPqeL1+VGfclBxDI8jn7e/u8LjiFFzSPctyF1yG3Ru0+fP9qm0EcQHIIuetmcI1QhxjBz
	d1RZizEyuKkw6yv7T3xlrBMpnW62mDWMwHW9QgxlSTnENIxbue3ELzC1/ywo6V98YtoZkS9tP8ZPq
	QlL1sb3Z62nXhc7pkL+9o4enIdGgrsjwB/+WzrajV4SIMgUe2brXhg42FIyqgseZ1ECn3Ld1K5xb0
	4yXMDpIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNYy0-00C6JM-2e;
	Wed, 10 Jan 2024 13:50:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNYxy-00C6H7-07
	for ath11k@lists.infradead.org;
	Wed, 10 Jan 2024 13:49:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5C04DCE1B4F;
	Wed, 10 Jan 2024 13:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE40BC433C7;
	Wed, 10 Jan 2024 13:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704894595;
	bh=MVID6r38g1l+bGAUAMzcuNJf21BLWjXML2xd0ZzLb/4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ngdY3fBQbptm+yDPwci8As+iUSZw0Dcm0Pxil5Pv51kIYKDmQlP4CrAYLS/sX7NDp
	 inyeGO6Bf2JOb1BeLVcw/ueiIbu8WRtOVqjLbLd1kPW8GNZRNjOoNzW2zPQfkJ5Sm9
	 fRfle5ksWZ3aJmdrSGEZMi9dh6xOCysO7QWOWLdBUqetEXmqztOgFyYRAX9ybNXByw
	 NRiWA/McEHm7LQcpEe9KRXEZraHQPyd9kY1paL0KuweUyz47yHti83GlEnqycjZMNF
	 MM5VVloSIPq1DZmYa2w/0uTHTGPAzMDHkkVGTyF0/UEhZYEnNVG8CzU9lqTDKvA0uD
	 O0O+5JpA4dhtw==
From: Kalle Valo <kvalo@kernel.org>
To: James Prestwood <prestwoj@gmail.com>
Cc: linux-wireless@vger.kernel.org,  ath11k@lists.infradead.org
Subject: Re: ath11k and vfio-pci support
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
	<8734v5zhol.fsf@kernel.org>
	<87fa5220-6fd9-433d-879b-c55ac67a0748@gmail.com>
Date: Wed, 10 Jan 2024 15:49:52 +0200
In-Reply-To: <87fa5220-6fd9-433d-879b-c55ac67a0748@gmail.com> (James
	Prestwood's message of "Wed, 10 Jan 2024 05:04:52 -0800")
Message-ID: <87r0ipcn7j.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_054958_258136_2F847BAE 
X-CRM114-Status: GOOD (  10.26  )
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

James Prestwood <prestwoj@gmail.com> writes:

>> But I have also no idea what is causing this, I guess we are doing
>> something wrong with the PCI communication? That reminds me, you could
>> try this in case that helps:
>>
>> https://patchwork.kernel.org/project/linux-wireless/patch/20231212031914.47339-1-imguzh@gmail.com/
>
> Heh, I saw this pop up a day after I sent this and was wondering. Is
> this something I'd need on the host kernel, guest, or both?

On the guest where ath11k is running. I'm not optimistic that this would
solve your issue, I suspect there can be also other bugs, but good to
know if the patch changes anything.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

