Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E97AC25B75
	for <ath11k@archiver.kernel.org>; Mon,  3 Jun 2024 18:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qBqK7qVzVOEWqWp/RDeHo+jRXw1H5HRb0oMZlwFmfb4=; b=N+tHku/bZFHFqCt3v6D2PM45AQ
	9ANUZsHaeTgU8chpfsj7w4toaNpArGk4W+i1T0M+FbOrQG1n2xJfnIj9y5dtD0BHAUErfLzeqBcSe
	9NWxK7828V5dfBaiHawMTwKZAyyg6NRQmFn2yTYj7II5N9pfYgsQGlgBBwGY+x9DJSFzUelNOZQ//
	S98dGzRIVyM1C0tBjgxycDuSzTlnxxICoj5vx9lBZhjNG3gp1QXxSdzw3qNePIeoLTNXaZF4ZJ124
	nw5wCl/vn0lofqZD1QQsbl4zHZlv6d/dIKhI7zTWQhTfInyHmx5x85biEYyb9WSDEFR55SNsEiW2s
	hDiP3LVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sECRS-000000001XF-2Bde;
	Mon, 03 Jun 2024 18:29:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sECRP-000000001WW-0y16
	for ath11k@lists.infradead.org;
	Mon, 03 Jun 2024 18:29:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B454C60F32;
	Mon,  3 Jun 2024 18:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECD0C2BD10;
	Mon,  3 Jun 2024 18:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717439392;
	bh=mNhvVNlm7lR5BWW0xTcHRwGUWRDr+XPiKpnaTJtSDTI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OkZuV1eVes1bmZwBJfIiWe1TuYU2eCulaWhDYbIQ6vzMFyaOAD8QPRxLbAyVHL9wa
	 aOkkSIhSzuJEqQBog1tDRdXeLpG0m/VC1G9Om4eLmdkgUqTbgYBXSXgzzzezGrrF0L
	 c2htHuvtT5if3G7uXQRjvkAhGsd9+9OwRi6wvWjUhRMoTbUvhi610iohydI++HjNHe
	 LpcZh2FSschBweqG/H5aKQNvQCEM8ZB9Ic02r9Fb67jykDi82yuxpgetbw8D0rIp/V
	 GTNZSGBtL1yRhYXTQypgCTgnc+OoLITtnoyQnItFbQw6FK/mcgi80sDmAmWTx7rS0H
	 9ignmGxUFxgZQ==
From: Kalle Valo <kvalo@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Dan Williams <dan.j.williams@intel.com>,  Dave Jiang
 <dave.jiang@intel.com>,  Bjorn Helgaas <bhelgaas@google.com>,
  linux-wireless@vger.kernel.org,  ath11k@lists.infradead.org,
  regressions@lists.linux.dev,  Jeff Johnson <quic_jjohnson@quicinc.com>,
  linux-kernel@vger.kernel.org,  linux-cxl@vger.kernel.org,
  linux-pci@vger.kernel.org
Subject: Re: [regression] BUG: KASAN: use-after-free in
 lockdep_register_key+0x755/0x8f0
References: <20240603165342.GA685076@bhelgaas>
Date: Mon, 03 Jun 2024 21:29:47 +0300
In-Reply-To: <20240603165342.GA685076@bhelgaas> (Bjorn Helgaas's message of
	"Mon, 3 Jun 2024 11:53:42 -0500")
Message-ID: <87wmn5ubfo.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_112955_336892_0C394DD8 
X-CRM114-Status: GOOD (  18.14  )
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

Bjorn Helgaas <helgaas@kernel.org> writes:

> On Sat, Jun 01, 2024 at 11:39:03AM +0300, Kalle Valo wrote:
>
>> Kalle Valo <kvalo@kernel.org> writes:
>> 
>> > Dan Williams <dan.j.williams@intel.com> writes:
>> >
>> >> Kalle Valo wrote:
>> >> [..]
>> >>> >> The proposed fix for that is here:
>> >>> >>
>> >>> >> http://lore.kernel.org/r/66560aa9dbedb_195e294b0@dwillia2-mobl3.amr.corp.intel.com.notmuch
>> >>> >
>> >>> > I get "Not Found" from that link, is there a typo?
>> >>> 
>> >>> I found this fix from for-linus branch:
>> >>> 
>> >>> # PCI: Fix missing lockdep annotation for pci_cfg_access_trylock()for-linus
>> >>> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=for-linus&id=f941b9182c54a885a9d5d4cfd97af66873c98560
>> >>> 
>> >>> But at least that doesn't fix my crash.
>> >>
>> >> Sorry for the broken link I mistakenly used a message-id from an
>> >> internal thread with the intel.com reporter. However, it is moot now
>> >> because the new direction is to revert the lockdep infrastructure:
>> >>
>> >> https://lore.kernel.org/r/171711745834.1628941.5259278474013108507.stgit@dwillia2-xfh.jf.intel.com
>> >>
>> >> (that link works...)
>> >
>> > Thanks, that links works :) I did a quick test with the three patches
>> > and I didn't see any crashes anymore. But to be confident I need to run
>> > overnight tests, I'll provide my Tested-by after that.
>> 
>> Ok, I'm now quite confident that the issues I saw are solved so:
>> 
>> Tested-by: Kalle Valo <kvalo@kernel.org>
>
> Thanks for reporting the issue and testing the fix!  Can you please
> respond with your Tested-by to the actual patch(es) you tested?

Not easily as I'm not subscribed to linux-pci list and I haven't
researched how to import mbox files to my mailer :) So feel free to
ignore my Tested-by tag in this case.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

