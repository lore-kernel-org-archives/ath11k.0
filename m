Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBFBC76196
	for <ath11k@archiver.kernel.org>; Mon,  3 Apr 2023 09:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tyq2MBcD2ZYS2CZ2ALIqXFRDknQ3JuXrhSv9ujJhG/s=; b=CcgJVXJ96xjdsL
	CHn4pTQQoT9mzae+WM5oJuzepeLueiZ/5e8t2YJ4HQ6u+V5+fwKKfyOsLXwWNv3ceLrrWxyBqlyDw
	z8WvdkIHFQ3YZwVdRLxDYcgdVSHKLcbYouobKJUsN0xSUpIgBXzbo/6ldUsOw3KZ+UHj+3THTTZuL
	iuamgvUejSBhr2obIJ16RBbfgfSQZxOyzl47Dr7875VhN8Vb4BI6D9moJ/9sTiH30GD/A7pQJVQt4
	TqRivE7uuotliugNfejw02IQwF6SRaagx7vhD6aEKeURnRoshNNe9gy6J+ml5WvJZjmdr+wFBThaT
	GTy1/ktgwsYW5EXwEe1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGHd-00EdwA-04;
	Mon, 03 Apr 2023 09:15:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGHZ-00EdvD-2Y
	for ath11k@lists.infradead.org;
	Mon, 03 Apr 2023 09:15:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 06F6BB8160E;
	Mon,  3 Apr 2023 09:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E820BC433D2;
	Mon,  3 Apr 2023 09:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680513318;
	bh=BVHiaqZpCtLErDvmtIzfl4mTYGJjwXmDlcErnLadaxk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=jr+L7EyRSikbGYpRta4fBY0N5qQ2Wi5PUj6GCOF9ADLd8r3JKx/QankHEx8cRw3qi
	 JMUwVTGwgbY2Cmp4TrYgBHdEEvqOimwowz3AVOZVCp4I+Z+H1YXQDtM/rwQHSVYzqD
	 Y8mNtPcjSgJZs/e+wLoFEe3k7ghYvdOJu5oq8KDQIHtp4DnrG6Qd0KlvdTVJMU+pAw
	 QGfi/WTUeSDuipgQWR3GvoLROMwgGStOLGB/4V+zaeJ35+P3QKaMXs1FF4pBRmT61R
	 KGgCY5y4pc/uft4Trvg8b9MQCcAbkL6XTESn1oaYshTfbI9y/2UJObNPl/+DeWGRVO
	 9lORJbdUuMLkw==
From: Kalle Valo <kvalo@kernel.org>
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH V2 0/2] wifi: ath11k: bug fixes in tx encap offload and ppdu stats
References: <20230401024932.11722-1-quic_pradeepc@quicinc.com>
Date: Mon, 03 Apr 2023 12:15:12 +0300
In-Reply-To: <20230401024932.11722-1-quic_pradeepc@quicinc.com> (Pradeep Kumar
	Chitrapu's message of "Fri, 31 Mar 2023 19:49:30 -0700")
Message-ID: <87edp1ba3j.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_021521_997215_09322A08 
X-CRM114-Status: UNSURE (   7.61  )
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

Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com> writes:

> Fixes bugs in radiotap fields and tx status reporting in TX
> encapsulation offload cases.
>
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>
> Pradeep Kumar Chitrapu (2):
>   wifi: ath11k: fix tx status reporting in encap offload mode
>   wifi: ath11k: Fix incorrect update of radiotap fields

No changelog. What has changed since v1?


-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
