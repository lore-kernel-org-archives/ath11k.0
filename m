Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4314C54ED1
	for <ath11k@archiver.kernel.org>; Sat, 24 May 2025 22:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxS4Ln3oPbm4sy1YgNsCi+sBXuqW+jXL43x4PIqWT+Y=; b=uHpQMMvrv68XkgQJVm0U3yIo3F
	duVm8MvKvMdv6YWTnlC18cFXG7ZSF8YXbyyxh5g3Mc2/kPUpk7CaFhShYrXXrIn2EQXF8+IgAFgCQ
	M1hPpHwV39ifNhSXSoi1zZACQu8gHUi9++skmA0etn0C+OLp6IJ4sAkc0dwTjFBNjUiHlciTdSw8R
	+PEnPtydLR8OjytUbBb21cfP6Xv3WQKP6bQxelXf9FbgkW70YtQ4Xf6x9U8bB/e4cUYyGYYg93lBS
	h++Ah9XgNVpo0oMEEb1EVipl6T0ZD7J8OXcpcc9CB2Yxe/OIncE0frRWGcMmSnWrR0Q312yHAhR2b
	7CzP6Qcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIwyJ-00000006Jw0-072c;
	Sat, 24 May 2025 22:04:03 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIwyD-00000006JuV-2mDX
	for ath11k@lists.infradead.org;
	Sat, 24 May 2025 22:04:02 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 80E801F95E;
	Sun, 25 May 2025 00:03:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1748124228;
	bh=jxS4Ln3oPbm4sy1YgNsCi+sBXuqW+jXL43x4PIqWT+Y=;
	h=Received:Received:From:To:Subject;
	b=TbSDtnbwR6u4HQPQ4qntVuxBFNUGTDFwwZKXLW66fi9ikAq+3Pv1u/5bUdxhES8pA
	 M/YMuwWJbFscjlAS4O1158TiI9aUtT+WCpjExGPLjda7FeJanlJA4P6jAq4Cgxs0Eg
	 VmydGL7OXdmOav7fGgxYoPib3pM6DJLHVGqrqsyGes9KM+da03+e0HoDecoEmqRUrk
	 5VFqD9xgKGvBRzkam+D2xVaOkBDA5ZHEoF+FgFUKfBG6LnIqaphgu6C3iT55gQNOL2
	 +jLx04FMuAEx5imRIgdJC9ZgHCZnYA0FTc7XyZiq6Qswz5MubPILbZowOpT9nYIYtk
	 R6L717K7XqPig==
Received: from livingston (unknown [192.168.42.11])
	by gaggiata.pivistrello.it (Postfix) with ESMTP id 395647F80F;
	Sun, 25 May 2025 00:03:48 +0200 (CEST)
Received: from pivi by livingston with local (Exim 4.96)
	(envelope-from <francesco@dolcini.it>)
	id 1uIwy4-00048G-0K;
	Sun, 25 May 2025 00:03:48 +0200
Date: Sun, 25 May 2025 00:03:48 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: ath11k-firmware: WCN6855 hw2.1: add Silex SX-PCEAX specific BDF
Message-ID: <aDJCRNUCzgtvTKjs@livingston.pivistrello.it>
References: <Z1bc_jn-k-88Io3f@gaggiata.pivistrello.it>
 <20250121113234.GA28230@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121113234.GA28230@francesco-nb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_150358_589155_D948F7C2 
X-CRM114-Status: GOOD (  10.88  )
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

Hello Jeff,

On Tue, Jan 21, 2025 at 12:32:34PM +0100, Francesco Dolcini wrote:
> +Jeff, that seems to be active on this area.
> 
> On Mon, Dec 09, 2024 at 01:05:18PM +0100, Francesco Dolcini wrote:
> > I'd like to ask for inclusion for the board file for Silex SX-PCEAX
> > radio module [1].
> 
> Any comment on this? It's been a while since I sent this and I had no
> feedback so far.

Jeff, any suggestion on how to move this forward?

Thanks,
Francesco


