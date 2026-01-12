Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA88C9EC90
	for <ath11k@archiver.kernel.org>; Mon, 12 Jan 2026 13:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jyOlQPaEAbxKJQPNNE2x1fQ6zeWwS8Egul3icukJIFA=; b=NWQrDxcp2RLwvYdEL6HY4cDN40
	OkQvaj/PictC0WYBIEDZFzGBp5XcLWBHXVyhmuGc/ZNhjc7q3sSNfnZjZxsPmU9BGJQptWvk7QBoV
	H5aHjeIadAgeIh76rmE/31jCMF+EzsVt+9ZEvu53bxNiTk20IBbmCvqeGcqvWs0ZcZ/Gl56N2Omjw
	io/UJpJDV1PqFUJ3+fmx1+wzydCrk/axrBJ1vpxfuUNpR119ZxJFi5AEjqdxJnOy5oOyfl3ZZgAIV
	ITEW/EbfLAbuzzbj8v7bfh4I0WOTcb3/a11fcNMj9BLQbJoRTVI8qhlklkOELYWqOpO+bl+dLyWla
	Clo3/ptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIE2-00000005QsS-1xdG;
	Mon, 12 Jan 2026 13:44:54 +0000
Received: from mail-10631.protonmail.ch ([79.135.106.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIE0-00000005Qrp-18IV
	for ath11k@lists.infradead.org;
	Mon, 12 Jan 2026 13:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768225486; x=1768484686;
	bh=jyOlQPaEAbxKJQPNNE2x1fQ6zeWwS8Egul3icukJIFA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=e0JTEjnJjvcXY8YjYFrJFkAz59n4OnO5/6vlN05GjWbWR1UYIoyiEQZoCC1unLD6g
	 B2aZpyav+R7WbcV86W82XD6nedqkHyo18jgZE+pwBEQs4oxUyXVVjvLwOcxVtBfqsu
	 oP5rkfsJX1oZRwyZzyELfxJNm/rp2gLeupLpnBVM6RWF4twoGlnwc8Hu6kw5nE6xGh
	 CkqFgDGit6FciocnFgTEn6GG/+QMUJxvq4szX6ILq2TjaSBMMHNrDRtYTq5/uq8Wsy
	 eRtj6qrUR4SyWYXrDO9hHfH8anTZVljzMFBZL63lf2un9eSu6ApnnT/8xry+yB2CDM
	 rIgVGxQf4G9+g==
Date: Mon, 12 Jan 2026 13:44:42 +0000
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: ath11k WiFi bringup on Milos SoC
Message-ID: <GaAXo-kja7_AolEgL2WpSAHlmV31nfKF1eSZT3MxICsKqQ4tBZFfzLhNB3-DmTHsTH_e-bwVR69U2Mo0OBbu96NDZYSAPXFDkZBOEUz0S-o=@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 09b0fbf707bf035f27c0fe50a26945130519c9d0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_054452_458590_E98D6EF7 
X-CRM114-Status: UNSURE (   2.61  )
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

In-Reply-To: <DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com>

Running into the same firmware assert on another Milos device w/WCN6755 tha=
t is running WPSS version WLAN.MSL.3.0.1-00156-QCAMSLSWPLZ-1.122511.2.12736=
3.2.

Would anyone from QCOM be able to provide more context on what situations f=
irmware would assert whal_wmac_transition_to_fw_control, or is it a catch a=
ll?

Thanks,
Alex

