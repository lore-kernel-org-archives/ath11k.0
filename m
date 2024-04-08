Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208CFC67861
	for <ath11k@archiver.kernel.org>; Mon,  8 Apr 2024 05:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APvBrL5nSIJ3ST0YJ/BGi37hipG42H9+DYXIrZ6pf2k=; b=SDqX9+2kDf3P0PPIrXGR/9lTWu
	n6TyiFNeCPP9pfx4N5uP/QWAp+IoA4DWg77htIXaKYjbf3eB/kDcLK49LePwn4LNuqcCIDhK9NsSk
	NGvNiAUYBVFn5jtxtTKwnW7aBb0Psr7pXCJDdrYbYMppK5chRc0YiDbwVtoIyU630wzgKOh7FVnxc
	VSamrQlttJfgoq7wdleFPMrZxWP4o3uScEbMwRCBV0PmA7wKvwhfGc9Qa8KpnufijWpnv2VQ0CKxg
	/L6ua2d5PpRXSrjvw3LjX7Y17P/F5aRm8gNfHwJLs6sXyD4byiz2VNXBRV7Xi0vYYBuThL8sl7sjF
	E9Ag8jQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rthTA-0000000EOAN-1EcD;
	Mon, 08 Apr 2024 05:23:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rthT7-0000000EO9S-1Aif
	for ath11k@lists.infradead.org;
	Mon, 08 Apr 2024 05:22:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C447DCE0A1D;
	Mon,  8 Apr 2024 05:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CDAC433C7;
	Mon,  8 Apr 2024 05:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712553774;
	bh=+Xex916LJFoZ3W4Dgzl3V7aRyJCfCaD7WKlHUi8q+d4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OgQACnxiLc9BGXO1WgFevLfauLeikoGLivwPtCmZMzynND/0L4zb9UIyGTMk6MOXK
	 XMHYR0tiF61q8dFtClF4u+tzSoCRucnKvXswGjAZ0wiTxLsIqXkNzqUUhpMhFnWjoi
	 wPjFuLHLrFj7JUoidrkTX6+xstxAiNb42Eibc537lOGw7i0xxkULwlOVKzhEpehJZQ
	 epWK2viSIzpdj8IG+Qa9t41TFbWk0MNtaLCnfc7PeF45CJGZ9fUbzAfjbMwnfH9dO+
	 a6EsCZ/w8fr2zgv7KG1oDajlf8CN67oTxnLJUP0UZ0bcS0ZwBK88Xz9F4xQlX9bwJx
	 zeXw17J662IjQ==
From: Kalle Valo <kvalo@kernel.org>
To: Wren Turkal <wt@penguintechs.org>
Cc: ath11k@lists.infradead.org,  linux-bluetooth@vger.kernel.org
Subject: Re: QCA6390 bluetooth doesn't work after warm boot or disable/reenable
References: <a03dace1-ca0f-41d6-8e2c-636e3b053a3a@penguintechs.org>
	<31bb6e18-ecee-49b3-87d7-50ab53e07447@penguintechs.org>
	<1b3d3937-6679-491e-a5c6-818ae8ac639a@penguintechs.org>
Date: Mon, 08 Apr 2024 08:22:51 +0300
In-Reply-To: <1b3d3937-6679-491e-a5c6-818ae8ac639a@penguintechs.org> (Wren
	Turkal's message of "Sat, 6 Apr 2024 13:27:56 -0700")
Message-ID: <87sezwjums.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_222257_530146_3E42DFA8 
X-CRM114-Status: GOOD (  16.17  )
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

Wren Turkal <wt@penguintechs.org> writes:

>>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA
>>> Failed to send TLV segment (-110)
>>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA
>>> Failed to download patch (-110)
>> Logs are mostly unchanges when restarting the bluetooth service
>> after a cold boot with the bluetooth originally working.
>> 
>>> FWIW, I get similar logs after logging into KDE Plasma. I also get
>>> similar logs after a warm boot.
>>>
>>> This appears to be some kind of bug in the initialization of the
>>> hardware. Is there any additional information I can provide to help
>>> troubleshoot this problem.
>> I will also say that the bluetooth appears to work throught a
>> suspend/resume cycle as long as I don't restart the bluetooth
>> service.
>> Oh, and my laptop is a Dell 9310 if that helps.
>
> Kalle, I noticed that you reported having a Dell 9310 in 2021 in a
> message on this very mailing list. Do you happen to still have that
> laptop? If so, so you still test on that laptop at all? I am curious
> if it is having the same issue I am experiencing?

Yes, I still have that laptop and I use it as my daily driver. But I
don't use Bluetooth and I don't even have the Bluetooth enabled in my
.config.

BTW ath11k is a Wi-Fi driver so most likely it isn't affecting your
problem.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

