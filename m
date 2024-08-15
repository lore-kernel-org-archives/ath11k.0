Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2689CC3DA7F
	for <ath11k@archiver.kernel.org>; Thu, 15 Aug 2024 15:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXrjIry5jtb3f1JXoz3LPnJ89y5xhbEEj40TfIl4nNk=; b=T+lPDawtlXgUx91mLUMImK3Kkn
	S8VUmqquNjAlq8Jkqxc5kyBEvdIadOtPKNerzkp7oX5g38Jm/GPqKf0Q7iV/p8saXQjyb7904LPin
	OGM8hD/TTrsE1C6BEt3A5sfklVbYtnyiwr/rKUi5QletEW6id9zStUE1cSOkF2aF/rYNrLUoU5Njm
	5W6BmcDAJMf44mFKlONEZ9mtj4TKhDHHUd6TkmS1NYLDlXLFmB9r5z7OzoGchszXSCzI1UzsxVRyk
	4/edn+eoYOKTguYVWML8gG86sq1SGvBX96837FumSTDFuliWF31h/vaRl+BLAKFUSqPstGym0euUF
	uFzRSXeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1secDD-0000000ALxV-2hrx;
	Thu, 15 Aug 2024 15:16:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seb9d-0000000A9eM-1YP0
	for ath11k@lists.infradead.org;
	Thu, 15 Aug 2024 14:08:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3E8C7CE1C7F;
	Thu, 15 Aug 2024 14:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A604C4AF0C;
	Thu, 15 Aug 2024 14:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723730918;
	bh=FuzAVsapDXM2kPBH1JbstQry8C9ktAsU6/i96DIuXk8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Tchp6JIpLlKomNlqI8m35yx/80/xClZOt5eVhKCgTTGaHm6T5vhmGRrV5+wkrsx12
	 rOqCC0VDwAd8PzVJixaWGVFopvbQft3GAwmxC+xKeoZ2WtWYVhZIqFYRAS+YsUIhgy
	 IPaiW6CRBxr4aQFdPm1jQgcawTYy3iQqtiWVhgSprvsVitLjj/1zrMS+3VNYJzgIR8
	 BP1b6qwy2BZrVrV6gDEfygQItlIOS0yT5T2rG83BzD3S4xQ2hqeWtw9KdpAypN58/9
	 SL71VGTP6mgUI3Id3jSc0LLsH2Ic4oCR3iLnt2jv3wGvVwBf45VJVSt3E7UfZ9u4Gu
	 bfloSOr7G4UcQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v6 2/2] wifi: ath11k: Add firmware coredump collection
 support
References: <20240813013028.2708111-1-quic_miaoqing@quicinc.com>
	<20240813013028.2708111-2-quic_miaoqing@quicinc.com>
	<4fc3d4a1-7dbe-412b-a6bc-72d0a5d13196@quicinc.com>
Date: Thu, 15 Aug 2024 17:08:35 +0300
In-Reply-To: <4fc3d4a1-7dbe-412b-a6bc-72d0a5d13196@quicinc.com> (Jeff
	Johnson's message of "Tue, 13 Aug 2024 12:12:12 -0700")
Message-ID: <87ikw1yj30.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_070841_599850_E2A2B248 
X-CRM114-Status: UNSURE (   8.90  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 8/12/2024 6:30 PM, Miaoqing Pan wrote:
>> In case of firmware assert snapshot of firmware memory is essential for
>> debugging. Add firmware coredump collection support for PCI bus.
>> Collect RDDM and firmware paging dumps from MHI and pack them in TLV
>> format and also pack various memory shared during QMI phase in separate
>> TLVs.  Add necessary header and share the dumps to user space using dev
>> coredump framework. Coredump collection is controlled by
>> CONFIG_DEV_COREDUMP. Dump collected for a radio is 55 MB approximately.
>> 
>> The changeset is mostly copied from:
>> https://lore.kernel.org/all/20240325183414.4016663-1-quic_ssreeela@quicinc.com/.
>> 
>> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04358-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>> 
>> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>
> Kalle, are you able to test this? I don't currently have a HSP setup

Yes, I have a WCN6855 test setup and I'll test this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

