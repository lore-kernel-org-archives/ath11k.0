Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33234C4332F
	for <ath11k@archiver.kernel.org>; Thu,  3 Nov 2022 06:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=000xFh5hCp55RPA0EIdq4tNsadUCCYxUBpOANLLDOVw=; b=QzcXL6Wt8HkLSj
	DE+Bot8imIxJHT8tq0tq3Iw8IhqC9uq9f7zjDK+e01VJvmbZrYgSlSUtqOCAHOe1cv4hJ/ICDU+j6
	aYjibSXCH6wfwanzU+HUBpmJjSa2oro9lGGDVRGP+fQP0w/fAkpib+D0q/HnIFTWYfY7MR33bu/ho
	IYiZc4XoL9EsXJXI//bN0avDjlpY4ij8bnj2TrWaSxOUOQzOiYNT76K9u76EVT6u9SKr/zrOk9p74
	Mv3mgp+qV12Er1P61z4NLkdgLxyVrlgxYYg27NFztJ70If+GAWqydHl4BbI4oyqhCyEi/OjPcvNyF
	wtuSrw2WMw/YtT3H+2vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqTOW-00GGNo-Hc; Thu, 03 Nov 2022 06:08:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqTOT-00GGNK-Uh
	for ath11k@lists.infradead.org; Thu, 03 Nov 2022 06:08:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6B2B261D4B;
	Thu,  3 Nov 2022 06:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4230C433D6;
	Thu,  3 Nov 2022 06:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667455680;
	bh=P1Zq6cY6WSNCfWyU+WHaR/g7Cg93v+I3gcBJVViYx7I=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=MSd1/IYVOvc1P362zJPZ5hBXNs5v+k2toHZjHZLwsC+233Vogc/h8gxvcFSr69tQ8
	 0zRyf9JTSRGpLyJ0dxX8dP7NfxuNExk7dihZoK1ZgDzqOEtgj9yO7EaMxPhbOB/6RF
	 OL4FcrjeIlI1IPQ1JfAe112CkqyqJoWesieKoAmQDGHs8llkfrr9i1j8ra5oRK6XtS
	 WfqVbMN8srwAPR1a1izQlj4l7ARMWQDDpcABAEzwS3+HhN1gI+mbFkLEcWjuKcgElH
	 Rc1PKr7GHmW0StFWidl4uMgLg58tO7UcG3iT/qNwR7IsNJrIipH6X4tyhS5Ph7Xl5+
	 RzGrMl5Rg0Ppw==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath11k: Make QMI message rules const
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220915002303.12206-1-quic_jjohnson@quicinc.com>
References: <20220915002303.12206-1-quic_jjohnson@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166745567687.21329.1292963060399122337.kvalo@kernel.org>
Date: Thu,  3 Nov 2022 06:07:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_230802_052940_69DD84CD 
X-CRM114-Status: UNSURE (   7.58  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Commit ff6d365898d4 ("soc: qcom: qmi: use const for struct
> qmi_elem_info") allows QMI message encoding/decoding rules to be
> const, so do that for ath11k.
> 
> Compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

93c1592889fc wifi: ath11k: Make QMI message rules const

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220915002303.12206-1-quic_jjohnson@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
