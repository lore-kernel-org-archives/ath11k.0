Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0559BC4332F
	for <ath11k@archiver.kernel.org>; Tue, 14 Dec 2021 15:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ic3GavqSzOPc+wSwGCYyXp4xv2ZUF8Qh/Eg5Lz2z7qg=; b=Fnh6oxfok1rjoT
	mcPGwErzU5i1/W7wBDU4Tj9nDe1mGuIbXSVZ6pJ12z+F5ozSga4na/IgffWpYTzZ35qzW4Dm/ndpw
	Sl3fuax1VB1c7O2in6dvQKa6l7reZtOovlqcwy463ycrdfYUCRoopOsNQJs8kaO2e1Kjp+gR+zK5s
	04WXdkR2iLTbS3OGwepO/JuJlAEnGIJV54QAm0jcLaZoYTbl2gO7bw6Nizk2KhFL2JUDDkakJOKim
	DLxP8CyxU9t9rkI3WcFZ2tqkrzJsT1V30Y902bfAnkXy6EB8r/WjivFQhW8nxusrE6K3XFhU/Y7Of
	aRZdTZO2rn5jKywLf/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx9lt-00Egqp-1I; Tue, 14 Dec 2021 15:31:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx9lq-00Egph-PX
 for ath11k@lists.infradead.org; Tue, 14 Dec 2021 15:31:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AC4F26148D;
 Tue, 14 Dec 2021 15:31:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB5BC34601;
 Tue, 14 Dec 2021 15:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639495873;
 bh=nIm7IP3pOSVJnjnVXQ9Ds8xTD2Whp9+vyIKmyYPKwgE=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=YQQKXqAkpyiAUzSd8+pmM5QYb+q0hRrZUMjB1UhJH+/c9O6wofnbfe+cEipEBUH2B
 HRqK6ThMBH26KhPpuFY6tmlVDNbFeL76CaFKCeE25/LrzXTiO6rujD3mBUZuNwwG6x
 tyEvELkXhrfW6I1+9TDI+M1WLQdkl/SZkIyQDCyf+GIRU5LxZZ6Sc69jIMqXwBagGi
 omI0S5WXSS1nhBoB8ETL1rFrXR/XFfJt5L33mbkZRxPoXXQamv1a4QEhbLw4Dfsmbx
 rM+iR2OR3fVdJmpytXcuNAWeZcv1fHSiUJM0bssJom12t6jq8a2XxcOoygyL+FaPjo
 OUPoggmB7D2HQ==
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: Fix a NULL pointer dereference in
 ath11k_mac_op_hw_scan()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211202155348.71315-1-zhou1615@umn.edu>
References: <20211202155348.71315-1-zhou1615@umn.edu>
To: Zhou Qingyang <zhou1615@umn.edu>
Cc: zhou1615@umn.edu, kjlu@umn.edu, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Shashidhar Lakkavalli <slakkavalli@datto.com>,
 Ganesh Sesetti <gseset@codeaurora.org>, kbuild test robot <lkp@intel.com>,
 John Crispin <john@phrozen.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163949586478.10444.18327229880355423779.kvalo@kernel.org>
Date: Tue, 14 Dec 2021 15:31:09 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_073114_905237_6378DE59 
X-CRM114-Status: GOOD (  15.18  )
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

Zhou Qingyang <zhou1615@umn.edu> wrote:

> In ath11k_mac_op_hw_scan(), the return value of kzalloc() is directly
> used in memcpy(), which may lead to a NULL pointer dereference on
> failure of kzalloc().
> 
> Fix this bug by adding a check of arg.extraie.ptr.
> 
> This bug was found by a static analyzer. The analysis employs
> differential checking to identify inconsistent security operations
> (e.g., checks or kfrees) between two code paths and confirms that the
> inconsistent operations are not recovered in the current function or
> the callers, so they constitute bugs.
> 
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.
> 
> Builds with CONFIG_ATH11K=m show no new warnings, and our static
> analyzer no longer warns about this code.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

eccd25136386 ath11k: Fix a NULL pointer dereference in ath11k_mac_op_hw_scan()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211202155348.71315-1-zhou1615@umn.edu/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
