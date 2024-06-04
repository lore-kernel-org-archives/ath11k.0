Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EBCC25B78
	for <ath11k@archiver.kernel.org>; Tue,  4 Jun 2024 17:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ulkRrmlSO7C2Gnp9b3ajPPDpKTSBYGgtHExF+oLHxk=; b=BoXy4EN8qbmF1SLTeU5hbg3mnu
	kkoWw5Wb0btYThslRskNmmIVTyTRpCjWwHpYjef8qoU14xSlSVhhSprtvIebsmwvbBAGbc6icsmX2
	flaUYGwix1IEEMTBj1wbryJRzh/4olVNwsBhfdvmEjgpw3PRVNx0PDLbm14rN6lS2nPLgFOn3DMUp
	fnTuvRxgZuqlgfZqnacC7Fk+8ew0buLOAQxHubYua8iACsNRG8rQUNZOmHDrN62R9XgBBQMd/PyqB
	GyDSc+LIxsdOmXhiQvlMu3o+bUl8FRQ0v7ZlpApLPZeaetpIne9vdg2iZrR3rjjb+eZlx/TSYkLoQ
	Hg0OYZlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXgu-00000003G01-3p88;
	Tue, 04 Jun 2024 17:11:20 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXgr-00000003Fyt-2Kgx
	for ath11k@lists.infradead.org;
	Tue, 04 Jun 2024 17:11:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AB694CE125D;
	Tue,  4 Jun 2024 17:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A18C2BBFC;
	Tue,  4 Jun 2024 17:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717521073;
	bh=H8UiO5YVsMUV3dpcXaV7RJ4HXiezpq63ohVSu9LX0MU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=auWON5ekYAJi+KBpiWfiZcAvVuoLdEU+oVN93tpqLmMP34F4V6FUlsgO7O5eb785I
	 QiKlG8awM4H06dXVJ5XyrV7nsWyhtThT1DenWN4wd3lO29xtF40fvAjijizyjASE4A
	 RsZpKzEcfGAyrz0G/M2fn5sK8KNFz1JstwNN+2/h0+Zdom7B49aJMw58iOQTHLVTAG
	 0MOBVFPMksW6hQlur91MSVRypj5eaClKAsQb1DA9of41jOGLRnaOYc4QyqmM5Cx785
	 4A7V2qJeDFe4hym2soYM0d1g2CrLOmKQgHjIjTO4mCxLykpYbYzzG5/HLyloAGCQlx
	 HhJYfvNwC7fHA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
  <linux-kernel@vger.kernel.org>,  Jeff Johnson <jjohnson@kernel.org>,
  <linux-wireless@vger.kernel.org>,  <ath11k@lists.infradead.org>
Subject: Re: [PATCH 1/6] wifi: ath11k: use 'time_left' variable with
 wait_event_timeout()
References: <20240603091541.8367-1-wsa+renesas@sang-engineering.com>
	<20240603091541.8367-2-wsa+renesas@sang-engineering.com>
	<47cc9455-6efb-4b1c-8743-c992e502633d@quicinc.com>
Date: Tue, 04 Jun 2024 20:11:10 +0300
In-Reply-To: <47cc9455-6efb-4b1c-8743-c992e502633d@quicinc.com> (Jeff
	Johnson's message of "Mon, 3 Jun 2024 15:57:28 -0700")
Message-ID: <87r0dcskep.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_101117_992036_B8EA83F1 
X-CRM114-Status: GOOD (  16.94  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 6/3/2024 2:15 AM, Wolfram Sang wrote:
>
>> There is a confusing pattern in the kernel to use a variable named 'timeout' to
>> store the result of wait_event_timeout() causing patterns like:
>> 
>> 	timeout = wait_event_timeout(...)
>> 	if (!timeout) return -ETIMEDOUT;
>> 
>> with all kinds of permutations. Use 'time_left' as a variable to make the code
>> self explaining.
>> 
>> Fix to the proper variable type 'long' while here.
>> 
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
>>  drivers/net/wireless/ath/ath11k/qmi.c | 20 ++++++++++----------
>>  1 file changed, 10 insertions(+), 10 deletions(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
>> index d4a243b64f6c..2fe0ef660456 100644
>> --- a/drivers/net/wireless/ath/ath11k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
>> @@ -2859,7 +2859,7 @@ int ath11k_qmi_firmware_start(struct ath11k_base *ab,
>>  
>>  int ath11k_qmi_fwreset_from_cold_boot(struct ath11k_base *ab)
>>  {
>> -	int timeout;
>> +	long time_left;
>>  
>>  	if (!ath11k_core_coldboot_cal_support(ab) ||
>>  	    ab->hw_params.cbcal_restart_fw == 0)
>> @@ -2867,11 +2867,11 @@ int ath11k_qmi_fwreset_from_cold_boot(struct ath11k_base *ab)
>>  
>>  	ath11k_dbg(ab, ATH11K_DBG_QMI, "wait for cold boot done\n");
>>  
>> -	timeout = wait_event_timeout(ab->qmi.cold_boot_waitq,
>> -				     (ab->qmi.cal_done == 1),
>> -				     ATH11K_COLD_BOOT_FW_RESET_DELAY);
>> +	time_left = wait_event_timeout(ab->qmi.cold_boot_waitq,
>> +				       (ab->qmi.cal_done == 1),
>> +				       ATH11K_COLD_BOOT_FW_RESET_DELAY);
>>  
>> -	if (timeout <= 0) {
>> +	if (time_left <= 0) {
>>  		ath11k_warn(ab, "Coldboot Calibration timed out\n");
>>  		return -ETIMEDOUT;
>>  	}
>> @@ -2886,7 +2886,7 @@ EXPORT_SYMBOL(ath11k_qmi_fwreset_from_cold_boot);
>>  
>>  static int ath11k_qmi_process_coldboot_calibration(struct ath11k_base *ab)
>>  {
>> -	int timeout;
>> +	long time_left;
>>  	int ret;
>>  
>>  	ret = ath11k_qmi_wlanfw_mode_send(ab, ATH11K_FIRMWARE_MODE_COLD_BOOT);
>> @@ -2897,10 +2897,10 @@ static int ath11k_qmi_process_coldboot_calibration(struct ath11k_base *ab)
>>  
>>  	ath11k_dbg(ab, ATH11K_DBG_QMI, "Coldboot calibration wait started\n");
>>  
>> -	timeout = wait_event_timeout(ab->qmi.cold_boot_waitq,
>> -				     (ab->qmi.cal_done  == 1),
>> -				     ATH11K_COLD_BOOT_FW_RESET_DELAY);
>> -	if (timeout <= 0) {
>> +	time_left = wait_event_timeout(ab->qmi.cold_boot_waitq,
>> +				       (ab->qmi.cal_done  == 1),
>> +				       ATH11K_COLD_BOOT_FW_RESET_DELAY);
>> +	if (time_left <= 0) {
>>  		ath11k_warn(ab, "coldboot calibration timed out\n");
>>  		return 0;
>>  	}
>
> This looks ok to me, but note that changes to ath11k go through the ath tree,
> so, unless Kalle has a different opinion, this should be submitted separately
> from changes that go through the wireless tree.

As there are no dependencies to other patches I can take this directly
to ath.git, so no need to resend because of this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

