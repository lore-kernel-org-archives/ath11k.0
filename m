Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24923EB64D7
	for <ath11k@archiver.kernel.org>; Tue, 20 Jun 2023 05:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J8xPmb4peUm4KFrZlFnd2QLrBkKDMn/tVtOhAUBk/mE=; b=Za0UYABQrmWrtK
	v3hpOomaFrxN66MHvRJHuUHJwi9EC90yPtMP4lkZCwbfgLDqZ5jSI5SYq3wYqVl2CJPkl03BSdkLt
	VLhGuOr57gTj7yWniga8ZuWPxfyjb1Qf9x5U99G62jdxuY+uNWG7RaESpln+8yaG8AJV1xQSCFM7L
	Uy6uEaOTVZmSSi4wOeRudl5ZQSiTvpjqAwkoZODtcag2ORe1q0WZrkD2cvqqDKxJCvxhfgrqcMV+4
	I2JMQLXgbEmVIYY4AZrk7sdAFof+vMA8wdvkpjOz0kc1WzfbzEahrPaDkjctfjbDnrbz0bRPD/kkd
	G6DqVzuWV7loN9R9Oynw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBTrA-00ABcp-0n;
	Tue, 20 Jun 2023 05:24:44 +0000
Received: from mail.mokrynskyi.com ([46.4.12.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBTr7-00ABcI-2O
	for ath11k@lists.infradead.org;
	Tue, 20 Jun 2023 05:24:43 +0000
Message-ID: <2699a08a-899c-6b97-eea7-f645388b78bd@mokrynskyi.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mokrynskyi.com;
	s=dkim; t=1687238680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b42XIoBe+3f/CTVPv+1/sb7CWRKxCj+PXv1JpV9I4N0=;
	b=lTOVqq1muvjAtkq+x4vntgUre6rY6zWQXOihpE0IBP95jDwOxvqmxDw680tnMLWvPa0YPQ
	9R1+diSIRP1xwpTcmKfvthtsO8BUKLbbUsvbtYKeXmWu1ePZyqEWzkMjIHl3E69+U22vI6
	FUOfbXOL4LQDg9bKlSEKaPNSFXnL1lfUUHWikbuFqHtwNjiCL/80i9rZ26wNLjYCXli13P
	pQdndw4qD1i/t9Wydza2SB8Ce85blSJQucPo3U7+o/EEF7jYW8n7D+qixvWwCf9E4ESUSA
	Bdiroy0xsXFwc0tMjA46bvTw7jqhTAyC1MkTsC06dCnxaMniWVOdovAcdQn53w==
Authentication-Results: mail.mokrynskyi.com;
	auth=pass smtp.mailfrom=nazar@mokrynskyi.com
Date: Tue, 20 Jun 2023 08:24:39 +0300
MIME-Version: 1.0
From: Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: ath11k and pass-through to VM (vfio)
To: ath11k@lists.infradead.org
Content-Language: en-US, uk
X-Spamd-Bar: ---
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_222441_926549_AC1A2674 
X-CRM114-Status: UNSURE (   4.20  )
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

I used Qualcomm Wi-Fi cards in VMs for many years now, but having issues with QCN9074.

I created a bug report https://bugzilla.kernel.org/show_bug.cgi?id=217570, but wondering if mailing list is a better place to discuss.

Just noticed /sys/bus/mhi/devices doesn't have anything in the VM, but it does on the host when correct driver is loaded.

Any ideas what could be wrong and what can I do to maybe help diagnose this?

-- 
Sincerely, Nazar Mokrynskyi
github.com/nazar-pc


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
