Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2434BC02182
	for <ath11k@archiver.kernel.org>; Fri, 24 Jan 2025 00:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jTXMQLYLnzzl4tMhcmVu4eyUgjcdCEZafbd/djhgyDc=; b=XqRxAaBRFixaZi
	JlDi8NGY2//EbOyTIxpdqGNlHad7Q1DEnGP7anZaxlZVnKOTdIYc9V9mzeaYojiBRT3c+mBQTT7si
	DjLTcoeZSC3PZre9NW4uVc3h84mlFuyCf9PDY7/eobyYfLrDgHvDcAaiyMARk3TddfjjqIUH/Quh6
	nVnuMsDJjTVLlVh6F6EkD7AyOKrx4OUOVMRJZlLzKEpN++fCVAnmogOs227ER89dKf2yFz/ns7rTS
	WeLRwKOPEenFbMTr4slHJMrskSxpwLxN5EKccs1yQM3mRwE4x9+IcLxik4UgaJTHRrNfzLdhuGXJU
	hvov3gameJdk9M8ztZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb7DC-0000000DYgH-2mzE;
	Fri, 24 Jan 2025 00:06:14 +0000
Received: from [38.43.111.254] (helo=mail.grupoarka.pe)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb7DB-0000000DYfq-0j2T
	for ath11k@lists.infradead.org;
	Fri, 24 Jan 2025 00:06:14 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.grupoarka.pe (Postfix) with ESMTP id 1629C1099AE63
	for <ath11k@lists.infradead.org>; Thu, 23 Jan 2025 18:40:29 -0500 (-05)
Received: from mail.grupoarka.pe ([127.0.0.1])
 by localhost (mail.grupoarka.pe [127.0.0.1]) (amavis, port 10032) with ESMTP
 id 4zVf-QkFuPJd for <ath11k@lists.infradead.org>;
 Thu, 23 Jan 2025 18:40:28 -0500 (-05)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.grupoarka.pe (Postfix) with ESMTP id 5522610A43DED
	for <ath11k@lists.infradead.org>; Thu, 23 Jan 2025 18:17:18 -0500 (-05)
X-Virus-Scanned: amavis at grupoarka.pe
Received: from mail.grupoarka.pe ([127.0.0.1])
 by localhost (mail.grupoarka.pe [127.0.0.1]) (amavis, port 10026) with ESMTP
 id z41sKKXzwVdr for <ath11k@lists.infradead.org>;
 Thu, 23 Jan 2025 18:17:18 -0500 (-05)
Received: from gosfordukfinanceltd.com (gateway [172.27.225.126])
	by mail.grupoarka.pe (Postfix) with ESMTP id 2348C10A03A17
	for <ath11k@lists.infradead.org>; Thu, 23 Jan 2025 17:58:50 -0500 (-05)
From: Mr Simon <simon@gosfordukfinanceltd.com>
To: ath11k@lists.infradead.org
Subject: RE: RE: NEW BUSINESS PLAN
Date: 23 Jan 2025 23:56:03 -0800
Message-ID: <20250123235603.062EFBB670BDA5D3@gosfordukfinanceltd.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_160613_342102_EB977E66 
X-CRM114-Status: UNSURE (  -0.80  )
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
Reply-To: ritchie@gosfordukfinance.com
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Greetings,

The GOSFORD FINANCE & LOANS LTD (UK) invites you to partner with=20
us and benefit from our new Loan and Project funding program. We
offer loans and funding for various good projects. This is=20
however in the form of a partnership.

Do you have projects and businesses that require funding? We are=20
ready to give out Loans (big or small), at just 2% per annum for
15 years. If you're interested in any of our proposals, then send=20
me your mobile phone number so that I can write to you or give
you a call for more details on our Loan Investment Funding Plan.

I look forward to your response

Mr Simon
GOSFORD FINANCE &
LOANS LTD

