Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3206C433F5
	for <ath11k@archiver.kernel.org>; Mon, 20 Dec 2021 19:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVn/dWUZtq59KQ//nNARtCHC1BhcjQCp9aVaRvjBjzQ=; b=HrlINv2/bvC+UA
	qRS1FJhZcNCXsCbg9Z+opKR+mZ+Fgtu0+3oYbiKLi8osOrwtEH5lq81aNlQJ5bPD82QDf2tJi3sJy
	7seAu+13JwR0l8L1y1QEHk1yILgY4OrxWtyXRjPxZuS7ZBOUTSSvLWvS5yfJwNKj5sNL16sR8xS6p
	cNAm05dRm8pFTabgKs4q2w5UVu1EU3uaDFv4TOgvlqcDkwQOeWsR5q9aXyzZh9zkvKC7h820Zsbme
	KiXx+UVwDvtpuotWTLTdyZfUT7//KJR/s0dVSHG+97u/PxZ8Y4n33JdtodAXuhFM4p6DyicMYr3cI
	Is6pF2J0ynJfVAqwkNhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzO9d-0042fS-0Q; Mon, 20 Dec 2021 19:17:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzO9X-0042dW-9p
 for ath11k@lists.infradead.org; Mon, 20 Dec 2021 19:16:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EAE2BB80E4F;
 Mon, 20 Dec 2021 19:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C642C36AE8;
 Mon, 20 Dec 2021 19:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640027812;
 bh=djGBlpOa14ExbuYSnVcKRoMovI5ZXBZfhMd0+S/onGs=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=ki+hJNxUfQNhxBGDYFxJxPNm2l+0NKTFMhAIeEaZdQhFhJ+QrAR2yD7CIgZLgiMNQ
 rwIUZpyweZTcAjZdhY5kMfDKgQmT+rC8uPh5GCA/0GMioNbZ722nll5st/+2TY44+C
 n9zhNPqOgej00SpD5L4B2Aq5UDSFQc+Xvz8VkdSljU4PW20AuIsyWwYxFlPlVMONbw
 1n479CDRLYFpNT3tIWuU87Syitl0jBBghFRs77vr3ZStYcourZaVno0Lp+OgHTtGDA
 CFofZY5HplT2GkVc+d0WyOsq8ccakOUHTWFCpDi4KY1PosNobOFv/opdA+Ao2lRh8H
 7go7FAQOG7sTA==
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ath11k: add LDPC FEC type in 802.11 radiotap header
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1638294648-844-3-git-send-email-quic_ppranees@quicinc.com>
References: <1638294648-844-3-git-send-email-quic_ppranees@quicinc.com>
To: P Praneesh <quic_ppranees@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <johannes@sipsolutions.net>,
 <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164002780766.16553.11348226804666046524.kvalo@kernel.org>
Date: Mon, 20 Dec 2021 19:16:51 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_111655_546725_FFF075E6 
X-CRM114-Status: UNSURE (   7.32  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

P Praneesh <quic_ppranees@quicinc.com> wrote:

> LDPC is one the FEC type advertised in msdu_start info2 for HT packet
> type. Hence, add hardware specific callback for fetching LDPC
> support from msdu start and enable RX_ENC_FLAG_LDPC flag while passing
> rx status to mac80211.
> 
> Tested-on: IPQ8074 WLAN.HK.2.4.0.1-01467-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>

Depends on:

57553c3a6cfe ("mac80211: fix FEC flag in radio tap header")

Currently in mac80211-next.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1638294648-844-3-git-send-email-quic_ppranees@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
