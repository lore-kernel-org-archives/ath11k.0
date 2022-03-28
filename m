Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C2FC433EF
	for <ath11k@archiver.kernel.org>; Mon, 28 Mar 2022 09:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+j2Bu/jJPSh9AXCZW3Y/Hh7yQrZYja5bvBGhp8Iod8=; b=EWzml08Ymqo9VN
	4ypzgDD50hA7WmURc6P2PVKxn8Go6nCl2IvxYRngRxgt5+NYxlMXTNpsjUERQxZ7mOkua9V/W2u9I
	N2S1qXVcbwDgK/s+ML76Ne6JD2ZXSmKTgfB5BNOo/MnG3RB1cvkv3PI24aS9ng+GT8D+oTR2jzkXA
	R+PoOtqGDM06CF6n4Gz3vTh30IjGtizcTZ0bwYHDO3c5W0QjUUdiHVoo7FGJ5DZ0SgNPCdX7aJUNB
	nI3HirluBGjwVZwB+dO4CGyJVjyFotdYlT6X7EWEaRevKwebWe2f/Rtj+JFzri8uKIVrkiOCYxxa1
	yDtdt+8iOcWVi49DSu1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYlXP-0081XA-Nm; Mon, 28 Mar 2022 09:19:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYlXN-0081WF-F8
 for ath11k@lists.infradead.org; Mon, 28 Mar 2022 09:19:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2219A60EFA;
 Mon, 28 Mar 2022 09:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F80EC004DD;
 Mon, 28 Mar 2022 09:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648459180;
 bh=ClHjhWRmcFOdOaa/lPlhbdmH1GQdx/klSYpf8w5b4sU=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=ZdC3lku6nl26vPWvj2h9LtHRt4ivBjHX1scpK9quD/5QBa3grT5Oi2fAddW/FBSdo
 9SKGBy1cWpZ/Jg14D68e1ZJxlxpaAb4xjAgE7Z8gRHEoZHQdOQqK32OrHDhkzNAw14
 ahQ8JYbOWsMZFtQ0TRewIquMMPKQvApFdGrPU5n5FKbrvzB+L+VRUL3Xv6MP8iZhSZ
 76TK9E+A0AJngoGsH0NhEwZesFXmYuNthrDo0x3UfQr3QTc+tlcZMLK5eCTXgViNcd
 86RG10eE9OVo3Q+dqTKQ0Hk/HwTKOKm6AkmKFOLKFKADXz2CL1g/TPTC331sQ/9cTd
 GPL7+8Fmh2Irw==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Rob Herring" <robh@kernel.org>
Subject: Re: [PATCH v3 01/12] dt: bindings: net: add bindings of WCN6750 for
 ath11k
References: <20220328060937.16738-1-quic_mpubbise@quicinc.com>
 <20220328060937.16738-2-quic_mpubbise@quicinc.com>
 <0256a6c6-088b-a7d5-68c4-b99238bbb0f4@quicinc.com>
 <87sfr2zb8y.fsf@kernel.org>
Date: Mon, 28 Mar 2022 12:19:36 +0300
In-Reply-To: <87sfr2zb8y.fsf@kernel.org> (Kalle Valo's message of "Mon, 28 Mar
 2022 12:18:05 +0300")
Message-ID: <87o81qzb6f.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_021945_581595_A774769A 
X-CRM114-Status: UNSURE (   8.13  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
>
>> Sorry for top posting, missed to add device tree mail aliases.
>> Adding them now.
>
> IIRC DT maintainers use patchwork, so adding them to CC in a followup
> email won't properly work.

Argh, s/properly/probably/. I blame it on the DST switch we had
yesterday :)

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
