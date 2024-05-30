Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5EFC25B74
	for <ath11k@archiver.kernel.org>; Thu, 30 May 2024 07:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jlffi05sG7E24hiKq4xvGXSdBs5C7tsCEr5WRiQxi/c=; b=UwrQjWUtlNYcPW
	tF5L9jZXnpHnPyBwRMKoMLOgORYMtTQpf7CoNf0CXAfoVPC1fQne6C9GEHvECsGu/x5XMypSkO0eo
	GcM/4OBNuretLtoxId4BZPw0215J0zBtnjXcy2K4Ul6Jg9a+/w1dASJ2LB6wU+9JLTHoqugWij2lf
	fGuD8bDTbpzIoLOIIGMXQoxJNtCH37ZigE5/riW1mZJOwTPqlVV4txEXsYqoMDnEQxnZVjY0vm2/r
	/yKCrYZ6iuHEXWM4twFzpvMbC4OsOIcee8D3KlCVXibXXyqW34reqDd9GhF1hFK7aim1CP8fQe4An
	R8Wc5mNkHzEIdAAavkpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCa3u-00000006UeB-23gb;
	Thu, 30 May 2024 07:18:58 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCa3q-00000006UcM-1q0B
	for ath11k@lists.infradead.org;
	Thu, 30 May 2024 07:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=Jlffi05sG7E24hiKq4xvGXSdBs5C7tsCEr5WRiQxi/c=;
	t=1717053534; x=1717485534; b=ck77G+4Hz2OcOZ8sS9iSaL0I9uF8sYYWZnTnd3lS2H14Rxb
	nMb9zHeUW/8P78e68d0ooBNEU7uQHGPVbUMGBp6jY2ft2t5zV0o/IWZ8ALDk6wG88QYUZhWLxEEy5
	vXS1zaDVJVXJ1wO0jR6Ep2czwwDxKHhXqx4UOKlcGsh4FRcwc/cfCLBzzjNTafUVO7ki0pOGn/uPm
	JFEuJww8hnHxYi+dL0JhQp6Z2GxtJwEDxR6kROkofTfMG/O82s9VOKXds/ZMBaTr+ejXOYEPkERh5
	3pyMq0wzYHCRkyqWsg44jO0TE3ZgbTpP0n30Xz7Hyc96DNpzEdjobHWU7sufTfPg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sCa3Y-0007Lh-V1; Thu, 30 May 2024 09:18:37 +0200
Message-ID: <93e4a06b-731d-4fe8-8ceb-e3b56d5ba2bd@leemhuis.info>
Date: Thu, 30 May 2024 09:18:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] BUG: KASAN: use-after-free in
 lockdep_register_key+0x755/0x8f0
To: Kalle Valo <kvalo@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 regressions@lists.linux.dev, Jeff Johnson <quic_jjohnson@quicinc.com>,
 linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <87v82y6wvi.fsf@kernel.org> <87wmncwqxf.fsf@kernel.org>
 <87sexzx02f.fsf@kernel.org>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <87sexzx02f.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1717053534;eb740ec3;
X-HE-SMSGID: 1sCa3Y-0007Lh-V1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_001854_669089_0A824734 
X-CRM114-Status: UNSURE (   4.73  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 30.05.24 08:53, Kalle Valo wrote:
> Kalle Valo <kvalo@kernel.org> writes:
>> Kalle Valo <kvalo@kernel.org> writes:

> I found my mistake and was able to finish the bisect. This seems to be
> the commit causing my problems:
> # first bad commit: [7e89efc6e9e402839643cb297bab14055c547f07] PCI: Lock upstream bridge for pci_reset_function()

FWIW in case you missed that: there are a few other discussions related
to that commit already:
https://lore.kernel.org/all/?q=7e89efc6e*

And a patch with a Fixes: tag for that commit, too:
https://lore.kernel.org/all/171659995361.845588.6664390911348526329.stgit@dwillia2-xfh.jf.intel.com/

Ciao, Thorsten

