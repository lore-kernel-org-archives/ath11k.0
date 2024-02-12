Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BB1C48297
	for <ath11k@archiver.kernel.org>; Mon, 12 Feb 2024 12:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVdXI0ZB4vehiyivEttDZJn3E2Jxr6cD7AWAF2Ejtok=; b=nrmLEMrSgl3JDX4G2z9mpUF/Nc
	R3wNjWenKhwDvj0SDVUKlbAeHJ6PoXwHwL5RcF/aggAoemprJPYI1+6tDrYF624tN/uGj0lU3Giio
	3aZfW/FUbR768bprnZbIRs2JzYkGAl4Mf366Uphd46U/hfmZB3YSlPmXekS4zjQVe4HGtkoX4aBKs
	TTsUhyHe9T7ON1/Yd/hzJws5+bd9YSJ/ClESfhHWPLeJuFvGNj18tp+1Ab5VNJO7c6mgxvx3w4XQ9
	XxlzGp93eW16qmLJwyAq7RWhPegcjm7eiRp9dV9UvanyJcopziV29MuS0f2I+Iaih3W2YVchMu05F
	Bmi0e65g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVqL-00000005Ktc-2CCF;
	Mon, 12 Feb 2024 12:55:29 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVqI-00000005KsW-1xBG
	for ath11k@lists.infradead.org;
	Mon, 12 Feb 2024 12:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=BVdXI0ZB4vehiyivEttDZJn3E2Jxr6cD7AWAF2Ejtok=;
	t=1707742524; x=1708952124; b=udrqircivar7W1pqNL10IQDh64bvZElbWET7B1a15AbWbPv
	0zF2KmPJ533mHPI2xzQ9IibE7FBnwgEJdZJe8d0lTyjEscxoktJlsW+t5b7pgAu+xxp70lRqXRuch
	ytGPK5jDvLe/ypdeucORpqOc8FOqu9hG6SxNKSiO7jfwm5wSz3VS06Q9L0NZQOAe1XVCEJDMN+lGs
	uu43qSR5m3PnZDrzicjISLMBoAn8NVm3gs49qKtylVU/lqo5Q6X1BTafgjfybTjxTffKMDB4ox5Go
	g7VhB5CV4fI7/X7NlOnccMF2bSyik7mT97YypanKBO2uRd1+fexMaVWOLzTts/eg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rZVqC-000000066Hd-0w52;
	Mon, 12 Feb 2024 13:55:20 +0100
Message-ID: <c6192c28d7d30198b8b53f89a06c0c37d4ab9d0e.camel@sipsolutions.net>
Subject: Re: [PATCH 0/2] wifi: cfg80211/ath12k: Add support to rx retry stats
From: Johannes Berg <johannes@sipsolutions.net>
To: Hari Chandrakanthan <quic_haric@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Mon, 12 Feb 2024 13:55:19 +0100
In-Reply-To: <20240212121616.3683197-1-quic_haric@quicinc.com>
References: <20240212121616.3683197-1-quic_haric@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_045526_529816_D6926B6F 
X-CRM114-Status: UNSURE (   7.07  )
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

On Mon, 2024-02-12 at 17:46 +0530, Hari Chandrakanthan wrote:
> This patch series adds support to count station level rx retries.
>=20
> wifi: cfg80211: Add support to rx retry stats
> wifi: ath12k: Add support to rx retry stats
>=20
> Tested-on: QCN9274 hw1.0 PCI WLAN.WBE.1.2.1-00148-QCAHKSWPL_SILICONZ-1
>=20
> Hari Chandrakanthan (2):
>   wifi: cfg80211: Add support to rx retry stats
>   wifi: ath12k: Add support to rx retry stats

There's trivial work here to expose them from mac80211, so please do
that. Also not entirely sure then why you need it in ath12k, but perhaps
if it's already done header conversion?

johannes

