Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997ACC433EF
	for <ath11k@archiver.kernel.org>; Tue, 10 May 2022 16:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wwxe8478tlPlRaYxmgASpD6iVgyhZm9kOxNn8WAvdzg=; b=1s55EpIX3nWwhe
	nISJrz1rIJ7EyapISmJOBYMkXIbtp8Ap+zjcsmQlseZEs6vi7FFVAytv9azC5MitTDXXtHc24q0cY
	9fYM4Huez7tWKTSbxkFupPutsWo4Y2NyrsDb03MfFtYrDAw4D6yFZKht1ygkYbnGLWq/izDjmJB98
	NxxXOeUMwvTszI36XrbrVvWK7PvpGwdvbiN9OaYxDyom00TV0Yv+YZ3L9HVoO94VFYZlsJU2m6hOH
	AnppM0x5PMV6hkztDFII/Qsp691v2E3P7CWpAFXpUc1xus8kFaerLCX4TY9FvtCd1R1WLcq/pYmvT
	J+4jPljS2EP2hRuseN8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noSo3-0037gy-1O; Tue, 10 May 2022 16:33:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noSny-0037fc-9C
 for ath11k@lists.infradead.org; Tue, 10 May 2022 16:33:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5630617F7;
 Tue, 10 May 2022 16:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D101C385C2;
 Tue, 10 May 2022 16:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652200425;
 bh=ATApjDbGMfNgkdqEBc3IxlSWcXiB++i8IPcApWWpGgQ=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=X2LmjkjLNvJUOzLyNiGBCJtUHXAZdoZ3EIYzzPO8nr3bB93uh9Qy+2v3Q2MbaR5J+
 SqNm0Sjhj0lHCbHA6lXVONJ8BQCSy7+nJIi+S6EpbeZoN3++rH94bQVr3c8sDqH84d
 ziEzz6fCI1OtXpmIEtnAnwlqyEXpmRwzcT6SHg1T4MFugBodG0pe998ref5hC+03bb
 3z6V+5rUNhWZpv42tU1Wc80DLgDtxz0Zy+R5RK+0nwRXNRc2aZf526ba5tx5uh4CQh
 xh+2OMBg4Nr1SlL/Ee+bSN1OX/E7p9QyY4OGtgAm2MgMuLtTu43yXfQKYIhwfiDFQW
 i3EaXUC978x5w==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Reuse the available memory after firmware reload
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220506141448.10340-1-quic_akolli@quicinc.com>
References: <20220506141448.10340-1-quic_akolli@quicinc.com>
To: Anilkumar Kolli <quic_akolli@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Anilkumar Kolli <quic_akolli@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165220042141.6768.14213090210900844797.kvalo@kernel.org>
Date: Tue, 10 May 2022 16:33:44 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_093346_407841_39206303 
X-CRM114-Status: UNSURE (   8.60  )
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

> Ath11k allocates memory when firmware requests memory in QMI.
> Coldboot calibration and firmware recovery uses firmware reload.
> On firmware reload, firmware sends memory request again. If Ath11k
> allocates memory on first firmware boot, reuse the available
> memory. Also check if the segment type and size is same
> on the next firmware boot. Reuse if segment type/size is
> same as previous firmware boot else free the segment and
> allocate the segment with size/type.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.6.0.1-00752-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Anilkumar Kolli <quic_akolli@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

5962f370ce41 ath11k: Reuse the available memory after firmware reload

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220506141448.10340-1-quic_akolli@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
