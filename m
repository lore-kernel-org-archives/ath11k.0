Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464D9C47073
	for <ath11k@archiver.kernel.org>; Wed, 10 Jan 2024 09:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMv2kvT4ZNq2om+ApD+I6KyCti7bx6rGRDhzd9p/R2w=; b=FFLrwqsoYuhK2cAXFfigOUttnM
	+deM1/5Wd8FLMKrFWJVkpLwI5V1SAb99PAhEXT40Nx+IuKlN44NXFoA3rTT7EK3CXX3AsHVwotJQD
	/96soTu7xmbz9nSgqB2ZNVnIZsX3nacRxeLr8J+5X/eLI+IsX4LpHIyDyZaJ1IbrwXnlsF4r4/qBb
	zY+Erg2LGW36uU8e8VX7QFtjJQpUUEMRe7DxSPaVSdercUeWsgJAEFutN0ki0S+QRrc9Td4I3eXPJ
	pv8g4DdQ/VpMCXar/x+4o3aZUwke1fd1Kwi0NlSE1XvCZ62sGVdiS7bIbleMEVAafnwQuzm+8Tb9q
	9bftLT+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNUSA-00AoVl-30;
	Wed, 10 Jan 2024 09:00:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNUS5-00AoV0-2c
	for ath11k@lists.infradead.org;
	Wed, 10 Jan 2024 09:00:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E4056132A;
	Wed, 10 Jan 2024 09:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F081C433F1;
	Wed, 10 Jan 2024 09:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704877245;
	bh=3+z0SdPTREQrbn1cVrx7uav3ugSi/3MWwFhTgEerRc0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=AIAPZciiyosFsW9jMaaEHumvKYvJUpzavuurVmZW/zggdoRg1bA4aZGbeIEQuXkPb
	 R8eyNqsVAT9BjdDkDrl6McijKr84VXzkkKId1kPfnzFfqHxs5NUgkTQKRexQ5oJC4g
	 47NxF5X9De26V4lWR5P0VvtF/+wRkjzcGUhuYyvMHkp6eabRrNM5fZ+m4FnhW8raqY
	 RdQcYl1v11YuzP97JOKfbw0IkwFznhVqeO2CbaJ/Q6tsOWMxDwRbmmzKNr3PleiC0l
	 4ZgK/uFCPWomGO1HDj6ZP8pZXEJ8UDztF9nzm/twgQ2ZdVYSU/lmsPFqtXdD13NB2F
	 qHphwVDcfN8qg==
From: Kalle Valo <kvalo@kernel.org>
To: James Prestwood <prestwoj@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: ath11k and vfio-pci support
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
Date: Wed, 10 Jan 2024 11:00:42 +0200
In-Reply-To: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com> (James
	Prestwood's message of "Mon, 8 Jan 2024 05:17:15 -0800")
Message-ID: <8734v5zhol.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_010047_930462_DECE6211 
X-CRM114-Status: GOOD (  16.48  )
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

+ ath11k list

James Prestwood <prestwoj@gmail.com> writes:

> For a while now I've been using vfio-pci to pass through wireless
> hardware to a Qemu VM. This makes testing kernel changes quick and
> easy compared to swapping the host kernel for reach iterative change.
> So far I've had very few issues doing this, maybe I've just been
> lucky... I tried doing this with an ath11k (WCN6855) card and ran into
> issues with the driver starting up. I'm wondering if its a
> configuration issue or just a lack of support by ath11k? The card
> works just fine when I use it on my host machine. Based on the logs it
> may not even be related to ath11k as wmi-bmof seems to fail first, but
> I'm not familiar with anything at the PCI level so I've got no idea
> whats going on.

There's a bug report about this:

https://bugzilla.kernel.org/show_bug.cgi?id=216055

But I have also no idea what is causing this, I guess we are doing
something wrong with the PCI communication? That reminds me, you could
try this in case that helps:

https://patchwork.kernel.org/project/linux-wireless/patch/20231212031914.47339-1-imguzh@gmail.com/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

