Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA878C47077
	for <ath11k@archiver.kernel.org>; Thu, 11 Jan 2024 17:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9psx6qtFuNYWMmfmOqiAFi8MRcSQSi/6F1BXThwMqso=; b=zGWiai+v9i2H/RLoQCp/b/0smw
	DS63kPjxHNZlT9QMB0mHL4l9dNxKsqfF20TWnocauIzCzpflk7Qk10nbvwGKX720RTUJ9ISLc94sv
	1CAIiSJnM1ei+uWHS3yL4xdfeSwe4TB1P/rsw4PWHZphHVcHFN5YSqPsU1LShTrHVilcBMVKRCtW7
	epyhdFw2LhlNlzTmH7lHG+JxOvezewV4Owf5eYkTdLt5/kFq3m7YrV9cMnFSvlYDxpWzjwjTT4vDy
	JECM5P3lZdQ38xRzYOfYtMNw0V+z/whwkldDU9IjrSbp0LzaTW/v7Q2+paGO3iVJRtI6FkLDUMRpu
	BzWupFPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNyTa-000gPn-0U;
	Thu, 11 Jan 2024 17:04:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNyTW-000gP9-2t
	for ath11k@lists.infradead.org;
	Thu, 11 Jan 2024 17:04:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1CD1361B43;
	Thu, 11 Jan 2024 17:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E51C43399;
	Thu, 11 Jan 2024 17:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704992653;
	bh=jaeSb7CanUzwRRRRLQaYLDJGUB6b+UPtSkI9H0rgATQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=tq1KpqeIn6bj0aYKzzPhdag10n+6t2TZPeNLnZ4oOyBvXyiir/fCFPlWuIpVUnoZB
	 S4vY/RltFZn+3kDOAPLD4TM8zyY3ChLT8bGqgqJh91qPX9cdLAyGfr+pe1hMmq5QRT
	 jVjdcFiapkB2cB62UigcGRyPEuak1A1f9yg3BbYuIhAQ81kDznhNbEm0sW4xSnOzi6
	 upGHnroWsr2jK6L9hZmfQUpqKTozxx0dVnSV0upVvCSCYJyviMIMJjyg/mekPvw4WA
	 Gk6OutuJI95LU/ku4CwS9FMabc/87nhgyfZJMw1mdHWGv8QyWCvkacuheRnNZwqnbQ
	 WVBZja/HBFaPQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] wifi: ath11k: add support for QCA2066
References: <20240109021336.4143-1-quic_bqiang@quicinc.com>
	<20240109021336.4143-3-quic_bqiang@quicinc.com>
	<e19baf59-c17b-4e2b-96d7-f4fc9812c99a@quicinc.com>
	<56282bad-b59d-4572-a6f1-1b905bf0edbd@quicinc.com>
	<da6ff953-07a4-4226-a7dc-b816f8dc5724@quicinc.com>
Date: Thu, 11 Jan 2024 19:04:10 +0200
In-Reply-To: <da6ff953-07a4-4226-a7dc-b816f8dc5724@quicinc.com> (Jeff
	Johnson's message of "Wed, 10 Jan 2024 08:20:46 -0800")
Message-ID: <87il3zajjp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_090415_021581_6BE2CDE1 
X-CRM114-Status: GOOD (  15.69  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 1/9/2024 6:16 PM, Baochen Qiang wrote:
>
>> On 1/10/2024 1:41 AM, Jeff Johnson wrote:
>>> On 1/8/2024 6:13 PM, Baochen Qiang wrote:
>>>> QCA2066 is a PCI based DBS device. It is very similar to WCN6855
>>>> overall: they share the same PCI device ID, the same major and
>>>> minor version numbers, the same register address, and same HAL
>>>> descriptors etc. The most significant difference is that QCA2066
>>>> supports 3-antenna configuration while WCN6855 does not. To differenti=
ate
>>>> them, subversion numbers are used. Currently four numbers are used
>>>> by QCA2066: 0x1019A0E1, 0x1019B0E1, 0x1019C0E1 and 0x1019D0E1.
>>>>
>>>> Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1-03737-QCAHSPSWPL_V2_SILICONZ=
_CE-1
>>>> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILIC=
ONZ_LITE-3
>>>>
>>>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>>>> ---
>>>> v2:
>>>>   - Rebased on ToT.
>>>
>>> hmmm, fails to apply using b4 shazam
>>>
>>> Checking attestation on all messages, may take a moment...
>>> ---
>>>    =E2=9C=93 [PATCH v2 1/2] wifi: ath11k: move pci.ops registration ahe=
ad
>>>    =E2=9C=93 [PATCH v2 2/2] wifi: ath11k: add support for QCA2066
>>>    ---
>>>    =E2=9C=93 Signed: DKIM/quicinc.com
>>> ---
>>> Total patches: 2
>>> ---
>>>   Base: using specified base-commit 2cd4e3f91f264926a6b11df948417b74d52=
ca9b9
>>> Applying: wifi: ath11k: move pci.ops registration ahead
>>> Applying: wifi: ath11k: add support for QCA2066
>>> Patch failed at 0002 wifi: ath11k: add support for QCA2066
>>> error: patch failed: drivers/net/wireless/ath/ath11k/core.c:711
>>> error: drivers/net/wireless/ath/ath11k/core.c: patch does not apply
>>>
>>> And sure enough the code at drivers/net/wireless/ath/ath11k/core.c:711
>>> doesn't match the code in the 2nd patch so something is amiss here.
>>>
>>> note your patch has reference to .support_dual_stations that is not
>>> present in ath11k -- perhaps there are other prerequisites?
>>> <https://patchwork.kernel.org/project/linux-wireless/patch/202307140238=
01.2621802-2-quic_cjhuang@quicinc.com/>
>> Yes, as said in the cover letter, this patch set depends on the above pa=
tch.
>
> Unfortunately automated tasks don't parse cover letters. But it looks
> like b4 doesn't handle or warn about:
> prerequisite-patch-id: 640366721125b1adea0eeabd5cdfca5e91476e7c
>
> And not quite sure how it would handle that.
>
> Kalle, that prerequisite series is set to Deferred and predates my
> transition to the ath11k maintainer role. What action is needed from the
> developers?
> <https://patchwork.kernel.org/project/linux-wireless/list/?series=3D76550=
6&state=3D*>

My plan was to run some tests on that patch before applying it, that's
why it's deferred for now. I'll try to do that soon.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

