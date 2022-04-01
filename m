Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91E5C433EF
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 06:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=noy/2wSet5YNFhgC8JHrQu/MiDu1o3HWXVCNFQy1+Ic=; b=wJTlJYjsLBD1oh
	rC+5bl3P/nAlnlkERSB3b4n9CSsUbmI9WAc5OWvCEgyrKseX0ljvE4ZtNo9ko1FSpw71fTQZvI9ai
	r4cST+6i+7UWXRNjk6OIgZa+eFmzyYAO5k5/l41caxjRtk28G+e+HjuI3cwPwx5JSA1g7RhNu4yqC
	lRGNMZvQVeVLG2Ks+jGhpSt31NvRgBTM2yAYbOJHH62Th7NKihqy95nZQdhxYYKKLSd1x+ThHCU/N
	YtPR6yOhJPAhrtGOhAMBk8FyzkCn/+YI1RwUqPCSgvIfuEp6dsIdqFSBP3KP+YyI6TCDcX9A7kMKy
	2sCR/tgZKymjUx20bFpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naAzs-004h4T-Fe; Fri, 01 Apr 2022 06:43:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naAzp-004h44-1G
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 06:42:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5F27CB823E7;
 Fri,  1 Apr 2022 06:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FEB5C2BBE4;
 Fri,  1 Apr 2022 06:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648795374;
 bh=zpGusPb2GLs2SQoY5se99PFqzVJuoqfex/4tGGoevZc=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=N5Ea4BGxpsw//UFyoH62ycEWvEBiVAwoIF/FMoLgiTcBr35nPlxCu/4w1ajovK6it
 q8nCzxUemFlnigkoxMohwSc1R7/EzPDwgaVf2bGWpQW/aZz1If1WqsaXZkHPLG9gzv
 7p+nK24AbO5YU78uh4toUeIjwj3G0sEdQ1o+E1F+xd8lQpfYBvO7MGU5PRNcfARMTV
 2Xa/T/cJ2V7u09zR2iuqmjjqkHFA4t2qo0Eta6q8NVLhWdEEciK1zoqAR2Z2OcmxLT
 Me/RxBVhqUduZumeF+rglptocwaFPwB+4qhatlw/2QoQ+oo/BKdDChohRzUzhjFOdL
 r6R9m83J9HFxQ==
MIME-Version: 1.0
Subject: Re: [PATCH v5.18] Revert "ath11k: mesh: add support for 256 bitmap in
 blockack frames in 11ax"
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1648701477-16367-1-git-send-email-quic_akolli@quicinc.com>
References: <1648701477-16367-1-git-send-email-quic_akolli@quicinc.com>
To: Anilkumar Kolli <quic_akolli@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Anilkumar Kolli <quic_akolli@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164879537083.4811.14737896570748276541.kvalo@kernel.org>
Date: Fri,  1 Apr 2022 06:42:52 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_234257_267166_C732B74E 
X-CRM114-Status: UNSURE (   8.39  )
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

Anilkumar Kolli <quic_akolli@quicinc.com> wrote:

> This reverts commit 743b9065fe6348a5f8f5ce04869ce2d701e5e1bc.
> 
> The original commit breaks the 256 bitmap in blockack frames in AP
> mode. After reverting the commit the feature works again in both AP and
> mesh modes
> 
> Tested-on: IPQ8074 hw2.0 PCI WLAN.HK.2.6.0.1-00786-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Anilkumar Kolli <quic_akolli@quicinc.com>

I'll add:

Fixes: 743b9065fe63 ("ath11k: mesh: add support for 256 bitmap in blockack frames in 11ax")

It's not clear for me if reverts should have the Fixes tag, but to be on the
safe side I'll add it.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1648701477-16367-1-git-send-email-quic_akolli@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
