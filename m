Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB30CA551C
	for <ath11k@archiver.kernel.org>; Wed, 13 Sep 2023 09:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CB4pVU+UF7/wLztl1V/EDjiP3WZf+2QGUAd8e35xFCQ=; b=vRnGRtD/Iat5qy
	dnzQJZYZsf0e0S3YWJMPHXTsFaOm8ZPCx04unCwWOyB9IHKqFMtQWfEg+H1I4akvxDecRIQtOmSnT
	gxos4RQEglklQJGoYoRG19GvXneoPsYLBamZU+M1ukbCWDJOcPrhZdT6vDELTEC9InY80SSQ9Ordt
	U19wTsWx6VV4XlsAPAnqzSzcU97Llswe/3iaoayVIYwCmOJkg4wDLjd210Fcxra1iqmb2JM4dV9Pn
	bn4WT204bPGDqqsLuWMmkUw3kCzVnDZF0AjBdDnooMs/mFS68NFNAoAJ/v3kATW6qNSg9aTC0Y3e5
	Uaer+BKxthwwsG9JZYzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgMBY-005JX8-0c;
	Wed, 13 Sep 2023 09:29:24 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgMBV-005JVq-3D
	for ath11k@lists.infradead.org;
	Wed, 13 Sep 2023 09:29:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=TQ4H4+5UEjJOeGCQe+dYsONPpdDZhbalRCDkfTb9DAA=;
	t=1694597361; x=1695806961; b=Fg65ZLaTzGRVVUDaQd1Opio3mWBkG8xXKrLD3MQ5jm0PVkC
	IgUpXLbm5rTgjXSY93dG4rJ60fNwm0kS5nk6fezGwd/+yT7R8y0zTjQwd+L7+dX85Bi5MCOupu0Kc
	wtqZx6bwc6nzMhx8TFNGFeowIimx1eSNTqaQn8uPIfuH1ZZwm3osZGobxu89EKmY0Ld8XW2Pn471x
	gpeaT7sMUxVqJpwByejSP2iEUaKiwLmaVZgiMcX7RdyrV+WpQ142DBeqDkB5S4dAp4mh7/UBk+BFi
	xrLa9uoKW2GmQW0y5/MYhCfBHZmXTUhCmwALl6CXNltENUxNvks+gWThvqTyME9A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qgMBT-00EjVY-0x;
	Wed, 13 Sep 2023 11:29:19 +0200
Message-ID: <f436ea028da7b016241f307348286be6cfe7df65.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/3] wifi: cfg80211: export DFS CAC time and usable
 state helper functions
From: Johannes Berg <johannes@sipsolutions.net>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed, 13 Sep 2023 11:28:54 +0200
In-Reply-To: <20230912051857.2284-2-quic_adisi@quicinc.com>
References: <20230912051857.2284-1-quic_adisi@quicinc.com>
	 <20230912051857.2284-2-quic_adisi@quicinc.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_022922_039620_487F7AD1 
X-CRM114-Status: UNSURE (   6.45  )
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

On Tue, 2023-09-12 at 10:48 +0530, Aditya Kumar Singh wrote:
> cfg80211 has cfg80211_chandef_dfs_usable() function to know whether
> at least one channel in the chandef is in usable state or not. Also,
> cfg80211_chandef_dfs_cac_time() function is there which tells the CAC
> time required for the given chandef.
> 

Should we really export the time function just for a debug messages?
That seems like a waste of space?

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
