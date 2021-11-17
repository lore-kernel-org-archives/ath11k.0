Return-Path: <SRS0=L+f/=QE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B01C433EF
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 09:35:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02CF7619E5
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 09:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02CF7619E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kj8znDo46mmNM0fXNWWf0mijlr9jTOuBvg1HHvA8o94=; b=ON1zuUbY6JxG5gad0T60oOaEB0
	qzLcPxtTolZI9jobnFVSnj9WVFXVbTzCtitkZexE6FZ1f12bfc8nsIYgHBwEmxj1b/1Gpg7VSr1am
	JSI+x4gPLK4cwdZGvr5ER4C7IylQRx7/9vcWyOSATh8SGpnbBD/yNTDLrUmYjqh39EjMKPodaoIjg
	QYm3KKvonrZS5W5W5VO3MdjMI99FcAftI5T1EICUTxu4jDXWENihAxczOGwC5KRkXE3qV03hke9Ry
	YLQNL50Kq11aJOXke8VNu0XTfoknLcueuzUZ+SiapltdcyECYLFC+fCXxYUsgnU6cxzqnKCr36s1Y
	vLKEhN/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnHM6-004IAJ-TA; Wed, 17 Nov 2021 09:35:50 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnHLs-004I5h-CF
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 09:35:48 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637141746; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=J9v9JrVfSADEur5gzTe1RmMYOu6pmmlAHUSlI2g3aXo=;
 b=mmJx6xKRvZkP5JgQMlSanUpnjhllwvSl6CD3ossSfyhPV+TWwONtpsVt/ZKHtDsTKfM+G6mU
 dyIInvYP0AJadzogo9RT5qjIGJFR//LXUlG4WrBQVpah9LgxLzFEadvwDg5DwLDQCT/TDGSA
 8qFfDIj/DWLiJWTmNEYO4vz/Oqc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6194ccd3c48ba488840962ad (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 09:35:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8C2BDC43617; Wed, 17 Nov 2021 09:35:15 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CCE7BC43618;
 Wed, 17 Nov 2021 09:35:14 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 17 Nov 2021 17:35:14 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v3 0/3] ath11k: add feature for device recovery
In-Reply-To: <87sfvvdx1f.fsf@codeaurora.org>
References: <20211015035459.14190-1-wgong@codeaurora.org>
 <87h7cdh970.fsf@codeaurora.org>
 <a9efda4011061f2f0d57ea597b9b8f0e@codeaurora.org>
 <87sfvvdx1f.fsf@codeaurora.org>
Message-ID: <21a93f4c93e636b47bd04e75cae90461@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_013547_386673_34780DD5 
X-CRM114-Status: GOOD (  16.22  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-11-17 16:08, Kalle Valo wrote:
> Wen Gong <wgong@codeaurora.org> writes:
> 
>> On 2021-11-15 20:53, Kalle Valo wrote:
>>> Wen Gong <wgong@codeaurora.org> writes:
>>> 
>>>> From: Wen Gong <quic_wgong@quicinc.com>
>>>> 
...
>>> 
>> 
>> I have sent v4, it is not to fix your fail:)
>> It added patch "ath11k: fix invalid m3 buffer address".
>> https://patchwork.kernel.org/project/linux-wireless/cover/20211116041522.23529-1-quic_wgong@quicinc.com/
>> 
>> 
>>> Also there should be a clear ath11k_warn() message when firmware
>>> recovery was successful, I could not find one from patches.
>> 
>> Yes, if recovery succes, it will have "success" log.
> 
> Where are the printouts? I cannot find any ath11k_warn() messages in 
> v4.
> Basically I would want to see something like this when the firmware
> crashes:

It is not print in this patch.
It is here:

ath11k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
				enum ieee80211_reconfig_type reconfig_type)
	if (ar->state == ATH11K_STATE_RESTARTED) {
		ath11k_warn(ar->ab, "pdev %d successfully recovered\n",
			    ar->pdev->pdev_id);

> 
> firmware crashed, restarting it
> 
> And once the firmware is running again:
> 
> firmware restarted succesfully

"firmware crashed" log is here:
static void ath11k_mhi_op_status_cb(struct mhi_controller *mhi_cntrl,
				    enum mhi_callback cb)
{
	struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
	struct ath11k_pci *ar_pci = ath11k_pci_priv(ab);

	switch (cb) {
	case MHI_CB_SYS_ERROR:
		ath11k_warn(ab, "firmware crashed: MHI_CB_SYS_ERROR\n");

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
