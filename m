Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C081C4707B
	for <ath11k@archiver.kernel.org>; Thu, 18 Jan 2024 11:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skouVceQ29oZp65jPGYBntx4MDLi3bMKxARrtDsxCy8=; b=GrBdvBdVu/T+OqhHJFCx85lqvn
	7a0Qz7O1kbGKEBqeYPfn09RikIYZlcEGZImB/fAxU2BmIcO9VwquRVxTbMESxiTpDuH2atXgBdqKx
	wT2UMmfBf/kANfhCf+9OA/G+COyB8Wa8nBmdJdmwhILvJLW2KkyCQPknJ3M4nLTDiQ/2+iju04o8e
	ZU1jLPDw969j4bZTJQenJsFqA3msq/0rqUMYs08gJC/fVODqRJl9yKkoG5JnZ5ol4gHUAv76VXFq6
	qfe+a5T3/qNjOnf5974++SHmkI85U5rWm2XQSH75ri5OeF4Yg6agOxJgJMJ1b+u2Z95KbQeL+EevK
	kWDM/X7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQQLv-002VcK-2t;
	Thu, 18 Jan 2024 11:14:31 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQQLr-002VXi-2v
	for ath11k@lists.infradead.org;
	Thu, 18 Jan 2024 11:14:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1BE4ECE1D81;
	Thu, 18 Jan 2024 11:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250BCC433F1;
	Thu, 18 Jan 2024 11:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705576465;
	bh=BkzJYAYQgD2+iSXa+2q/zYdRmPKlL7wyGiHR8aVNN4g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OzcIPV/gWl6CabGnDEMnseP1mKLqiGDBskbxq0RxpBZvS0ZCi7NXpzAfovpNFOn5z
	 PlgFwuOxYc5HCboVmBC9a4sbslrzg2Byedi7cvYX413GkmDC1GyvtkY7kgFSMQZoKq
	 qNYeJO7fOj6J6xRuV8Q61qWUCpkCGBSvvI+gxNzYUn0Lzp9A7X9MdpsNA21fxHpBm6
	 J3lHLDvutO+OJ2qbIAQ6YL1rHZPi5wDmYSEtZkxVpZZCHTuF3UxCnsapRYkbzOuISf
	 m54biY+Qc+5HaDB0gnvQZDveAC7cdmudFriG9XH5X9q0EKatpqsGk6R0OYPyUds/6C
	 gUsnEfVSdgXPQ==
From: Kalle Valo <kvalo@kernel.org>
To: "Nicolas Escande" <nico.escande@gmail.com>
Cc: "Jeff Johnson" <quic_jjohnson@quicinc.com>,
  <linux-wireless@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <ath11k@lists.infradead.org>
Subject: Re: [PATCH] wifi: ath11k: fix layout of scan_flags in struct
 scan_req_params
References: <20231127180559.1696041-1-nico.escande@gmail.com>
	<bdcdbd06-e9bd-4a92-b27b-d94b2d8fb52d@quicinc.com>
	<CX9YPUDTAT1N.23DMRB5O9FEAO@gmail.com>
	<20c7a367-2243-4e13-b023-9999dc6c6790@quicinc.com>
	<CXC03GYAN4VN.2PQ88Q1S7IL6H@gmail.com>
	<CYFAYRP5MWTZ.Q272WWLLE7MW@gmail.com>
Date: Thu, 18 Jan 2024 13:14:22 +0200
In-Reply-To: <CYFAYRP5MWTZ.Q272WWLLE7MW@gmail.com> (Nicolas Escande's message
	of "Mon, 15 Jan 2024 14:09:28 +0100")
Message-ID: <871qae51wx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_031428_116546_A2A0D83C 
X-CRM114-Status: GOOD (  18.93  )
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

"Nicolas Escande" <nico.escande@gmail.com> writes:

> On Thu Nov 30, 2023 at 9:24 AM CET, Nicolas Escande wrote:
>> On Tue Nov 28, 2023 at 1:57 AM CET, Jeff Johnson wrote:
>> > On 11/27/2023 2:54 PM, Nicolas Escande wrote:
>> [...]
>> > > So either we should not use WMI_SCAN_XXX with scan_req_params.scan_flags ever
>> > > and only use the bitfield to set scan parameters or if we use WMI_SCAN_XXX with
>> > > scan_req_params.scan_flags they need to match the corresponding bitfield.
>> >
>> > IMO the correct thing to do is to remove the unions from that struct and
>> > only leave behind the bitfields and not use the WMI_SCAN_XXX masks
>> > except when filling the firmware structure.
>> >
>> > But don't spin an update to your patches until Kalle has a chance to
>> > give his opinion. I'm new to maintaining these drivers and Kalle may
>> > have a different opinion on this.
>> >
>> > /jeff
>>
>> No problem, I'll wait for Kalle's input on this before doing anything.
>> As soon as we decide which way is the right way, I'll work on this. I only care
>> that this gets resolved.
>
> Hi Kalle/Jeff,
>
> Any new input on this so I can move forward on fixing this ?

Sorry, too many patches...

> Otherwise I think I'll end up going on with Jeff's proposal of only using the
> bitfield for intra driver representation & then converting the bitfields to
> their corresponding WMI_SCAN_XXX when transmiting the req to the hw with wmi.

Yeah, I only took a quick glimpse but Jeff's proposal does make sense.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

