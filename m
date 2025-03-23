Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D83AC28B30
	for <ath11k@archiver.kernel.org>; Sun, 23 Mar 2025 20:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7Cs40h1I32QA6hah5heYVE4/zI7hWbUU2YmAjNIFo8=; b=jHmfIlZ30dLle9kVNyiOt9f94N
	lB/cXlgmlYQaoFcwdgk/b/6Out08+g8Nuq2C803yEV8HIg8xEPOiJMQp72KvtdUfEMVKyI+2myeUv
	WY73wfmzoGluAHa/Mhx3XIF/8lT3/tGr08uEvMQJnuIm2PODVql0AtRKO941mOUnTUpZETIWSvV6L
	yeJe2NrfglUs+kxI5Nao7lxlWLKw6T/g3NSunDoR3+IyOJPXIck/F4fu0Lsm1zij2mpTNs3rRo/w9
	FDBsjF6ZbGfkHWXKTrNS3GPrZeKJeVvNMI0nFOB0VGTCVzT7kTUrug665Q6q4IeTEu3mMhv5w3kyp
	ldkD1zPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twRgk-00000001g4L-0iWg;
	Sun, 23 Mar 2025 20:12:54 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twRgh-00000001g3q-2thH
	for ath11k@lists.infradead.org;
	Sun, 23 Mar 2025 20:12:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1742760765; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AM1DN9WbGR93tp8Nt4Em/P4TSnXZE5tC61utHpEvDWs0BSaYTkDG89667KSmHt1bVkCs3WJ3oyefuthr5gHSbEO/Z6dtHv/4aeI1ALw+Dqp0Zrfc/f7Dabn/hDKAqbdrfxa2Yma1BmUkunS3df0OW2iAYbSGAfeF1TDSXvqa5y0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742760765; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=t7Cs40h1I32QA6hah5heYVE4/zI7hWbUU2YmAjNIFo8=; 
	b=ITz1lzJzEIj9uQnksnZoKa0F6xJA4wEf1qT5gMB+mHxLrAjAC+HJwgZcHi3mHDILuYv3YPE/IaICvry8hcE1wu9MOy1rn6cyn9VZ8wa7kkReTTdbwxio9VFkiIVuZIfMhoQv0XJdX1hgFakc5uTUNO23AAgIjRZoBd3vYm2iRYQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742760765;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=t7Cs40h1I32QA6hah5heYVE4/zI7hWbUU2YmAjNIFo8=;
	b=Dke5Xn3yagnMDoMgp2SbUANxyZLruYV1kMxWyv7n6OJNYxrVp0nhU1MtBoVNj4sV
	v8JeQsiMhWbhIl1Nk+0VTisDu1ET8IwOssWw5OzEez9696bRGWom7OeCZyFIYcC5qH+
	AkNZPFjVhYl1ezwdbk+6qUB7R6f+1QPC21shXtF4=
Received: by mx.zohomail.com with SMTPS id 17427607646843.6235385042233474;
	Sun, 23 Mar 2025 13:12:44 -0700 (PDT)
Message-ID: <d71241e5-fa21-4aa6-936d-a7a97a8a07b5@collabora.com>
Date: Mon, 24 Mar 2025 01:12:39 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/5] wifi: ath11k: bring hibernation support back
To: Baochen Qiang <quic_bqiang@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250320023003.65028-1-quic_bqiang@quicinc.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <20250320023003.65028-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_131251_845555_0E908A14 
X-CRM114-Status: GOOD (  11.78  )
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

On 3/20/25 7:29 AM, Baochen Qiang wrote:
> To handle the Lenovo unexpected wakeup issue [1], previously we revert
> commit 166a490f59ac ("wifi: ath11k: support hibernation"). However we
> need to bring it back, of course with additional changes such that Lenovo
> machines would not break.
> 
> As those machines work well in Non-WoWLAN suspend mode, the thought here
> is that we do WoWLAN suspend on Lenovo machines while do non-WoWLAN
> suspend (which is done in the reverted commit) on other machines. This
> requires us to identify Lenovo machines from others. For that purpose,
> read machine info from DMI interface, match it against all known affected
> machines. If there is a match, choose WoWLAN suspend mode, else choose
> non-WoWLAN mode.
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=219196
I've tested the series and it works. Feel free to add my tag to the
series. Let me know any more help with testing is required.

Tested-on: QCNFA765
WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6

Tested-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

> 
> Baochen Qiang (5):
>   wifi: ath11k: determine PM policy based on machine model
>   wifi: ath11k: introduce ath11k_core_continue_suspend_resume()
>   wifi: ath11k: refactor ath11k_core_suspend/_resume()
>   wifi: ath11k: support non-WoWLAN mode suspend as well
>   Reapply "wifi: ath11k: restore country code during resume"
> 
>  drivers/net/wireless/ath/ath11k/ahb.c  |   4 +-
>  drivers/net/wireless/ath/ath11k/core.c | 245 +++++++++++++++++++++++--
>  drivers/net/wireless/ath/ath11k/core.h |  11 ++
>  drivers/net/wireless/ath/ath11k/hif.h  |  14 +-
>  drivers/net/wireless/ath/ath11k/mhi.c  |  14 +-
>  drivers/net/wireless/ath/ath11k/mhi.h  |   5 +-
>  drivers/net/wireless/ath/ath11k/pci.c  |  44 ++++-
>  drivers/net/wireless/ath/ath11k/qmi.c  |   4 +-
>  8 files changed, 301 insertions(+), 40 deletions(-)
> 
> 
> base-commit: b6f473c96421b8b451a8df8ccb620bcd71d4b3f4


-- 
Regards,
Usama

