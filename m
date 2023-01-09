Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC5FC5479D
	for <ath11k@archiver.kernel.org>; Mon,  9 Jan 2023 10:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CiJ57wMFRORQ0rfaOHhZdEbigfCXI/PTePIHuB2KTIA=; b=o7UQQYafdnjKT1
	y3VFYS0B6WXmCCtdOA2wtm3EVPINwQL64bfq3/8DmdeIbEMwA03B4B0QR+v2HhHHAXl23CWaWMQdO
	im58UO/hOAuRtVXJygNfVd2ccQifZ2UtPv78kfm5n3qzEnnvMVgEra34DrM0SHdYccNjNq/8IBp+T
	BQCEXXGu+OVDCxVKgv3Q9aDJ4Uhs+6xx4OVuSt3Nswl3FxLFIoV1+WEfT4iM98t4LXONdcfU6Yy8q
	jSKfQPaGJgcZ8WBM7fXJhAlmNVgoe5ZbSx8gTa387vW6eD/rEDHZ2wS3WjqCE2JRfucZcDw8mdhg2
	w0jkj/p6UZqr9T4/4/AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEp0z-000hX0-Fq; Mon, 09 Jan 2023 10:04:25 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEp0w-000hTG-DU
	for ath11k@lists.infradead.org; Mon, 09 Jan 2023 10:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=LXYtkwCulJxyYDxEsC2KhrmJMtqjpJOVDebzve+DexM=;
	t=1673258653; x=1674468253; b=B69eJkjruIaa5wI2WvV2QIIDB9ZFgZsKknN5cpi+3b8lp04
	FWIuIi1Q7wl8E+SEOxW+g610QWYZl4Mn2Sm0xIzOUc3D0O3Xm99/MkWjjP4+XXT2N1V2VVXTYwNYe
	Z4kVtMp3Lsd4yVx3AMfPoPwFQ7+/oc3RuKK1I1lLma5Io1+ZrmuPSZzOvFSwg423oDgfHQhHzykiD
	RP7i1cj6zKYq8OCNi2iusVqN3wmK9CwshCaSUOGetRt+dtG5mJVCtsF6wisaVD9kma3fw9mefB2A8
	nAWsqEl/fXR8QuALqagXVUtITIYiObHctvnTMlu9r2qyhUYyB14GBiuNR5hR3fgA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pEp0h-00EE7p-1e;
	Mon, 09 Jan 2023 11:04:08 +0100
Message-ID: <598af0e9da276e2e7f03f3a7c2a85e3391333a9d.camel@sipsolutions.net>
Subject: Re: authentication timed out by "wifi: mac80211: do link->MLD
 address translation on RX"
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Date: Mon, 09 Jan 2023 11:04:06 +0100
In-Reply-To: <efad76dd-14ff-4a36-ec67-fe6f3b8dcc5b@quicinc.com>
References: <efad76dd-14ff-4a36-ec67-fe6f3b8dcc5b@quicinc.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_020422_466089_CC05E63D 
X-CRM114-Status: UNSURE (   8.17  )
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

Hi,

On Mon, 2023-01-09 at 17:48 +0800, Wen Gong wrote:
> Hi Johannes,
> 
> When the rx packet is skb_copy(), the hdr is not re-assign the new skb 
> value, and lead the
> 
> operation of "translate to MLD addresses" take effect on the original 
> skb, and lead
> 
> the check "if (!ether_addr_equal(ifmgd->auth_data->ap_addr, 
> mgmt->bssid))" fail in ieee80211_rx_mgmt_auth(),
> 
> and thus happened "authentication timed out".
> 
> After below change, issue not happen again.
> 

Yeah ... We found and fixed this, and then a few days later someone else
submitted a patch for it:


https://patchwork.kernel.org/project/linux-wireless/patch/20221208040050.25922-1-quic_srirrama@quicinc.com/

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
