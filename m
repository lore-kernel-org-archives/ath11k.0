Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD930C36002
	for <ath11k@archiver.kernel.org>; Mon, 24 Mar 2025 15:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4xR9VE1NaFO5E89Eu2vSzswDn4nEIcCrHZN3QTlCSo=; b=D60vwRiMueBH9TA4pZXiBTwJQ1
	lMskjKl3nbptQFjpYU/0Rin5co1x/H0XVY2NCPc1yNUlrxlR9UNfzg+3KRx8+pzaTRq5ZTuooPOV1
	hb+DRokEpQ6GeHYgl6Y6h2DsbBWA9c90GH7ItS2dY0Yp4j8W8QkK8jwgdcv8Bme6m6/yBssR5ZIb5
	engujCN4DT31TWBXAz2Jcxm37GARW3T7E7ooBPZ+cMjHvGsVsQRugQPt4b+jFsASWoP2bbbBHaz07
	pXcMQW6+e1xw+Fls7XCxRPD9PWfcpDnwqQZFinG+1caeCyMvTis+G2Gci85PfRzjucRtShzG9WDIy
	zJzmWrYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twjOJ-00000003TdX-1B46;
	Mon, 24 Mar 2025 15:07:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twjOF-00000003Tcr-2UiK
	for ath11k@lists.infradead.org;
	Mon, 24 Mar 2025 15:07:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B528BA4A1A5;
	Mon, 24 Mar 2025 15:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79172C4CEE9;
	Mon, 24 Mar 2025 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742828818;
	bh=SnVSl6CFkIX1PkG6+5tqHKeiuhjmt7k8KNcJ9EMCjNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TZlp/Oi+lydf9fiE3l+P76ctLCKI9DERztCr2kxIwLt7Ou1/j/s0QZgnAL7o5XsPT
	 E5BxaWDmH7DKF+FiQlAiXFizJnopkoU1ZCpK6HukkTk5ICp5Y1aTEW5/bhsmJgP41M
	 WqdU6bO7H5DuQ9iTokQq8f+FuamvnIFX4Eefljjcq3/cPMVJ23USkIXNmaWDICJSDk
	 tCSSJAntvyA+JNk6sZlaJ2OZa6gjfaxFs+XD1sCNVfdFVdo7tx4qw7OvNrg+NmvBpJ
	 ORKs96t2zrEmRZweCqfRqPiVpFkZZhTnR4FP1F+UUhcQTTDxf4SDhubHSPQkSywXtZ
	 p7o/ce2miSkwQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1twjOE-000000002vu-0XPG;
	Mon, 24 Mar 2025 16:06:58 +0100
Date: Mon, 24 Mar 2025 16:06:58 +0100
From: Johan Hovold <johan@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Steev Klimaszewski <steev@kali.org>,
	Clayton Craft <clayton@craftyguy.net>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: fix rx completion meta data corruption
Message-ID: <Z-F1EoFxY3qVZiXZ@hovoldconsulting.com>
References: <20250321145302.4775-1-johan+linaro@kernel.org>
 <5d872cf0-ca57-4017-b06e-fce9c11813dc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d872cf0-ca57-4017-b06e-fce9c11813dc@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_080659_696775_FC07E057 
X-CRM114-Status: GOOD (  12.72  )
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

On Mon, Mar 24, 2025 at 08:03:15AM -0700, Jeff Johnson wrote:
> On 3/21/2025 7:53 AM, Johan Hovold wrote:
> > Add the missing memory barrier to make sure that the REO dest ring
> > descriptor is read after the head pointer to avoid using stale data on
> > weakly ordered architectures like aarch64.
> > 
> > This may fix the ring-buffer corruption worked around by commit
> > f9fff67d2d7c ("wifi: ath11k: Fix SKB corruption in REO destination
> > ring") by silently discarding data, and may possibly also address user
> > reported errors like:
> > 
> > 	ath11k_pci 0006:01:00.0: msdu_done bit in attention is not set
> > 
> > Tested-on: WCN6855 hw2.1 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> > 
> > Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> > Cc: stable@vger.kernel.org	# 5.6
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=218005
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Does this supersede:
> [PATCH] wifi: ath11k: fix ring-buffer corruption

No, this is a separate fix. There are more places where barriers are
missing, I'll try send some further fixes during the week as well.

Johan

