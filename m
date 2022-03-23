Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B18CC433EF
	for <ath11k@archiver.kernel.org>; Wed, 23 Mar 2022 13:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aw3jq1GSJfU0n/D3/bPecf8EI8My9WB2PIGJFtz4XO4=; b=KF8Xkq1DjHJheD
	n2KJdeoe9j60APbMszQ0bge2AS/rr9N2nUvKK5QvLZxfCabYvuUEkcY0kb2R3Ad6w75Y4BlOrmU+3
	tcOk6oQZTHvmj/X/H6oeUK81F5U3xySKAG9laxOee2KdM2zzPPW0UvRkjh3CvAtFi932eD+AUfnwj
	OJlur/JPw5iESOy1gfqazL3YnwlRwQciK7IiJs9ZhiOwncRw6++TbtKaOuKbXiwnwILA0CnpmiAVl
	bZQtoU5sMsI/y1c8OT+sdbPP4QOmsSd/F3+7HkndTLyrxWMz1Na7i6qG+DPF2PUYGNrCd86p1v2eR
	Gzzw1vdk7XWppXXo5KXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX0gR-00Dfy6-U7; Wed, 23 Mar 2022 13:05:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX0gP-00DfxU-6C
 for ath11k@lists.infradead.org; Wed, 23 Mar 2022 13:05:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B3BB4614AA;
 Wed, 23 Mar 2022 13:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52772C340F2;
 Wed, 23 Mar 2022 13:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648040748;
 bh=tHsyjwpNSbihQ+nfFKQQGpXUDzivyStE32WHuyKcSTY=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=KTfdSqDPJw314OiqtKVL4wQdxrmMsTF+8b/qF2Letd0fMr7ii9sdZI5yErd9YTuz1
 DV72OeLZFWonHZwscLFH0gb/I9ZrdNsy1Y+FShMfcbjlPikOxch9FULiYeL/GXl5d9
 Mwx6vHqorzWDVskSX8Zqh7k1tcV+YeB84Bi5OSRUYhAQwUVYLZFhzWm/ZV51VtzczD
 O1yMEVPRX/YQJbFZ0Q3vOMJCv3gJRETyhurx3bis5AzIgecyvLgUPo0YdUoeXh+c0R
 fEWT/nxgW81aOLTupNYHQvp8aFpSxBfygfpcsAxe3g95/WzXinYRnj0T3ADNsHLczE
 Qt6Kr9DzPQZsQ==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v6 2/2] ath11k: add read variant from SMBIOS for download
 board data
References: <20220315104721.26649-1-quic_wgong@quicinc.com>
 <20220315104721.26649-3-quic_wgong@quicinc.com>
 <87r16tkqbx.fsf@kernel.org>
 <1c4230e0-f01e-0db1-af95-65aa2d3ac508@quicinc.com>
Date: Wed, 23 Mar 2022 15:05:42 +0200
In-Reply-To: <1c4230e0-f01e-0db1-af95-65aa2d3ac508@quicinc.com> (Wen Gong's
 message of "Wed, 23 Mar 2022 16:52:43 +0800")
Message-ID: <87h77okee1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_060549_294154_1788D81C 
X-CRM114-Status: GOOD (  12.22  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> On 3/23/2022 4:47 PM, Kalle Valo wrote:
>> Wen Gong <quic_wgong@quicinc.com> writes:
>>
>>> This is to read variant from SMBIOS such as read from DT, the variant
>>> string will be used to one part of string which used to search board
>>> data from board-2.bin.
>>>
>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>>>
>>> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
>> [...]
>>
>>> +struct ath11k_smbios_bdf {
>>> +	struct dmi_header hdr;
>>> +	u32 padding;
>>> +	u8 bdf_enabled;
>>> +	u8 bdf_ext[1];
>>> +};
>> I was about to commit this but noticed bdf_ext[1], is there a reason for
>> that? Use of [1] in arrays is deprecated nowadays:
>
> Kalle,
>
> no reason for it, please change bdf_ext[1] to bdf_ext[0] or bdf_ext[].
> It will also work well.

[0] is deprecated as well so I changed it to [].

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
