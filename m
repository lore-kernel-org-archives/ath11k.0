Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C48C6FD19
	for <ath11k@archiver.kernel.org>; Mon, 13 Mar 2023 17:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ebHmB/+CC5qGuHC5OV/UkCU2lgRb7GnU2DrRkMt196o=; b=opRc3GasdtO1YB
	LeJR6m6w+Lw70CqxD/vC2FkmDX6GOyvlCG3M43rULs18bPEuy7adHGuPiV9EHn6uhya/x0TyyMdlp
	B87//bqM3bqa0qU6TBm1HB5Zd6mT6zYZgmKT7X9pDQy9TExKx+n3nX+O/V+BQicFXtVXTQLoVGliM
	a38ZwK0QkA5ePOXXoxWgRST5N4d1x5BcnFPZIA9q/4uCycJnIDea/ytXgBb3VGtQt0n23LZ+TNZyd
	KpM8BO6rb3f1DgVGmBRrOxaGppyoiRJxRzGI61X0cibLF/MvEQQvP/D0/WKre/PvToVmoknF6B/an
	vvo3Ocu030dvz6ha0VMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbm1P-0078AD-Qd; Mon, 13 Mar 2023 17:31:43 +0000
Received: from [103.30.145.160] (helo=defaultworkshop.klidefectmanagement.com.novalocal)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pblys-00775C-Ev
	for ath11k@lists.infradead.org; Mon, 13 Mar 2023 17:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=asda.co.uk;
	s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=h8LCzwXA7uSsWeB7ZstlIgknO4LLc9eHw9UXGJuP6Lw=; b=V
	a9EJEqylIy43nnQK/nQvUscUr8gAOMtaVbTweDqCOnb/3A8kCp6MkZGjhZyM7DJmXudRHWIX9nM7+
	Dm+QPcVW9QxrM9tL35YyOePGQE7GyR8ASw6SxjRd+RHeSXuTd0Hyrr6ZbKvJSrkdDzO5R+uC3Mejh
	0nHpo2w/wnZoNqZA=;
Received: from ec2-52-11-215-80.us-west-2.compute.amazonaws.com ([52.11.215.80] helo=asda.co.uk)
	by defaultworkshop.klidefectmanagement.com.novalocal with esmtpa (Exim 4.94.2)
	(envelope-from <sales1@asda.co.uk>)
	id 1pblyq-00066e-1d
	for ath11k@lists.infradead.org; Tue, 14 Mar 2023 00:29:04 +0700
From: ASDA Stores Limited <sales1@asda.co.uk>
To: ath11k@lists.infradead.org
Subject: First quarter procurement order/enquiry
Date: 13 Mar 2023 17:29:03 +0000
Message-ID: <20230313152049.C813EBA6C53DDC99@asda.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_102907_947373_A6A47D64 
X-CRM114-Status: UNSURE (  -0.82  )
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
Reply-To: sales@asda-c.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Dear ath11k
I'm a procurement manager  with ASDA Group (the owners of ASDA 
Stores) and your company product has caught our interest. 
Therefore, we request you send
list and prices of your hot selling items (products) for our 
evaluation/pick.

Soon as we receive your reply, we shall send you our company 
profile and buying proposal. You can also check our website below 
for detailed info of our purchase area and trading capacity.

Your immediate response E-mail:  sales@asda-c.com   shall be 
appreciated.

Best Wishes

Ms Stelle Montgomery
Purchasing Dept.
ASDA Stores Limited
Tel:  +44 7418367220
WhatsApp: + 44-7502985874
Website: www.asda.com

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
