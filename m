Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A667C433EF
	for <ath11k@archiver.kernel.org>; Fri, 10 Dec 2021 00:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFz0oKOHCCDeZAg1mjqYNhaTtD5xKcou0dMXzd8zogY=; b=Vuu/PA1fw5jHT5
	ojqpHZPppYA3kIVrnbLXqk2bqHgW/aiEdnyeLBBdh8KWvEN8qm6rzgTSZ897Q8ZTkf+E9RD6igSAP
	I5wGsnus3tG4QAEM2SSXL9EMaWGJnn83ohVzJjN1mIEIIkW4m/dOwRz6azL8efwRg/ZDNwn13L88I
	fB2snI6GMSlogUaXzxTWibjTZlsBbOb/64GN2yb/HEov8C7XwVLFIfYU+E+0UCmj/BYavWRG4cg6y
	1mA379XVXKyncnGHyzZLGE1U+Ao4zp7vFQRCvuL/nW2zdrVgwNjtDvlQIqP4u4acNb64dbzlnzhdQ
	Q1A4DnsvJ9IgfL5ydjzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvTbB-000TQH-Ax; Fri, 10 Dec 2021 00:17:17 +0000
Received: from relay034.a.hostedemail.com ([64.99.140.34]
 helo=relay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvTb8-000TPs-D6
 for ath11k@lists.infradead.org; Fri, 10 Dec 2021 00:17:16 +0000
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay11.hostedemail.com (Postfix) with ESMTP id 0C95B807F8;
 Fri, 10 Dec 2021 00:09:11 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf10.hostedemail.com (Postfix) with ESMTPA id 4CA472F; 
 Fri, 10 Dec 2021 00:09:05 +0000 (UTC)
Message-ID: <4446ca5bf0a8120a37f89cdb0f50d898636630a2.camel@perches.com>
Subject: Re: [PATCH 1/2] ath11k: add dbring debug support
From: Joe Perches <joe@perches.com>
To: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>, 
 ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Thu, 09 Dec 2021 16:09:04 -0800
In-Reply-To: <1636439522-14509-1-git-send-email-quic_vnaralas@quicinc.com>
References: <1636439522-14509-1-git-send-email-quic_vnaralas@quicinc.com>
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 4CA472F
X-Stat-Signature: cwg8qj6swyif77ag6yqpc5cjdeyzoa7p
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19Kw86AOTeybW33uD29/bmbVIk9l8MkLzg=
X-HE-Tag: 1639094945-176582
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_161714_518388_C01796E1 
X-CRM114-Status: GOOD (  14.30  )
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

On Tue, 2021-11-09 at 12:02 +0530, Venkateswara Naralasetty wrote:
> Target copies spectral report and CFR report through dbring to
> host for further processing. This mechanism involves ring and
> buffer management in the Host, FW, and uCode, where improper
> tail pointer update issues are seen.
> 
> This dbring debug support help to debug such issues by tracking
> head and tail pointer movement along with the timestamp at which
> each buffer is received and replenished.

> @@ -1068,6 +1107,166 @@ static const struct file_operations fops_simulate_radar = {
>  	.open = simple_open
>  };
>  
> +static ssize_t ath11k_dbr_dump_debug_entries(struct file *file,
> +					     char __user *user_buf,
> +					     size_t count, loff_t *ppos)
> +{
> +	struct ath11k_db_ring_debug *db_ring_debug = file->private_data;
> +	static const char * const event_id_to_string[] = {"empty", "Rx", "Replenish"};
> +	int size = ATH11K_DBR_DEBUG_ENTRIES_MAX * 100;
> +	char *buf;
> +	int i, ret;
> +	int len = 0;
> +
> +	buf = kzalloc(size, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	len += scnprintf(buf + len, size - len, "------------------------------------\n");
> +	len += scnprintf(buf + len, size - len, "| idx | hp | tp | timestamp | event|\n");
> +	len += scnprintf(buf + len, size - len, "------------------------------------\n");
> +
> +	spin_lock_bh(&db_ring_debug->lock);
> +
> +	for (i = 0; i < db_ring_debug->num_ring_debug_entries; i++) {
> +		len += scnprintf(buf + len, size - len,
> +				 "|%4u|%8u|%8u|%11llu|%8s|\n", i,
> +				 db_ring_debug->entries[i].hp,
> +				 db_ring_debug->entries[i].tp,
> +				 db_ring_debug->entries[i].timestamp,
> +				 event_id_to_string[db_ring_debug->entries[i].event]);
> +	}

I think this would look a lot nicer column aligned along the | boundaries

	len += scnprintf(buf + len, size - len, "--------------------------------------------------------\n");
	len += scnprintf(buf + len, size - len, "|  idx |    hp    |    tp    |  timestamp  |   event   |\n");
	len += scnprintf(buf + len, size - len, "--------------------------------------------------------\n");

	spin_lock_bh(&db_ring_debug->lock);

	for (i = 0; i < db_ring_debug->num_ring_debug_entries; i++) {
		len += scnprintf(buf + len, size - len,
				 "| %4u | %8u | %8u | %11llu | %-9s |\n", i,
				 db_ring_debug->entries[i].hp,
				 db_ring_debug->entries[i].tp,
				 db_ring_debug->entries[i].timestamp,
				 event_id_to_string[db_ring_debug->entries[i].event]);



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
