Return-Path: <SRS0=1RzP=HL=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B914C433E6
	for <ath11k@archiver.kernel.org>; Tue,  9 Feb 2021 08:11:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0F9164E50
	for <ath11k@archiver.kernel.org>; Tue,  9 Feb 2021 08:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0F9164E50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oUhRSqslVBQCDN8xhXyTBysYcz6jQ7l1UzHuZFXN4FA=; b=ylnghrmMrkoNOLr5znKSsxfVG
	MAfvPq1cgS6wftpaBqQJFEJXJ9H5NmcrYVYZniuaA+Fq926TcwE6yxzJWnWDYsHNMrZqTi6aT5kfy
	BI6fhLkJCYhr0G/d0eH9x6Vnce2JgI4uhd04e32c4RiDLEnis7f2KoyED1NcFOZGm5KpsQ2Mqwj4M
	Rs6/XrB8vUy3SQ8/xip1OTsyrLEh7Be5D+rjo9pAkUj03i8fXN9NR8d7dnBFGbqMgHClVmYqOriQN
	wrjyiZNtgNN09O0AhPxMQmx3oQ2RmnDUtdm0haLIX2pHR3LyeTaZXN29zUQc97bAUuqmoNtELmvha
	CF1DRvFOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9O6t-0008JP-G0; Tue, 09 Feb 2021 08:10:59 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9O6q-0008Is-NR
 for ath11k@lists.infradead.org; Tue, 09 Feb 2021 08:10:57 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11989w6H049624;
 Tue, 9 Feb 2021 08:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=6WBn+2Hi2T1V/VaRwjSEeDcMUQ5xJY2XA4AOwl22ZW4=;
 b=u/y9VV4oA9IXWDqJarKH/bJ3umy9IFNSP6YEPfzxqv5ePKqOMvvAxPUY1Dr0JGfTAK6V
 KVNcAxmIZaNrVR4aTDqjSr88/xj+0wy0uz8UdIvoDrRn5nl9rGfUnRrp8oDtUwbAArM+
 CVzEhJS8yHktKUzJv/Mpn0p7lPb3T+5S+I+x0MQ39zTxNTbFHsWZrkH/+k2IgZMIEpOb
 xPYtZqD95vR7CC1Z3CSv659+LUyYXUA8650lkJHnxoEkL6LdV9iZTVUjLXy8JLlY7GxO
 5ffe3aG1ZkcYCzgY2ikxutIXP9sdbYu7992Ok4X5qi+lnJeGK5lmERgN4pA6AYvQdMIN ug== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 36hkrmxhdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Feb 2021 08:10:49 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11981PEX018041;
 Tue, 9 Feb 2021 08:10:46 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 36j510w0pb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Feb 2021 08:10:45 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 1198AhUP024443;
 Tue, 9 Feb 2021 08:10:43 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 09 Feb 2021 00:10:42 -0800
Date: Tue, 9 Feb 2021 11:10:32 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] ath11k: fix a locking bug in ath11k_mac_op_start()
Message-ID: <20210209081032.GP20820@kadam>
References: <YBk4GoeE+yc0wlJH@mwanda>
 <87ft25vg1t.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ft25vg1t.fsf@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102090037
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_031056_947930_4C55146B 
X-CRM114-Status: GOOD (  32.86  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Carl Huang <cjhuang@codeaurora.org>, Peter Oh <peter.oh@eero.com>,
 ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Tue, Feb 09, 2021 at 09:47:10AM +0200, Kalle Valo wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> 
> > This error path leads to a Smatch warning:
> >
> > 	drivers/net/wireless/ath/ath11k/mac.c:4269 ath11k_mac_op_start()
> > 	error: double unlocked '&ar->conf_mutex' (orig line 4251)
> >
> > We're not holding the lock when we do the "goto err;" so it leads to a
> > double unlock.  The fix is to hold the lock for a little longer.
> >
> > Fixes: c83c500b55b6 ("ath11k: enable idle power save mode")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > v2: reviewers were concern that v1 was racy
> >
> >  drivers/net/wireless/ath/ath11k/mac.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> > index c1608f64ea95..464d3425488b 100644
> > --- a/drivers/net/wireless/ath/ath11k/mac.c
> > +++ b/drivers/net/wireless/ath/ath11k/mac.c
> > @@ -4248,8 +4248,6 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
> >  	/* Configure the hash seed for hash based reo dest ring selection */
> >  	ath11k_wmi_pdev_lro_cfg(ar, ar->pdev->pdev_id);
> >  
> > -	mutex_unlock(&ar->conf_mutex);
> > -
> >  	rcu_assign_pointer(ab->pdevs_active[ar->pdev_idx],
> >  			   &ab->pdevs[ar->pdev_idx]);
> >  
> > @@ -4262,6 +4260,9 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
> >  			goto err;
> >  		}
> >  	}
> > +
> > +	mutex_unlock(&ar->conf_mutex);
> > +
> >  	return 0;
> >  
> >  err:
> > -- 
> > 2.30.0
> 
> But now rcu_assign_pointer() is called while conf_mutex is held,
> previously it was not. I didn't check if this creates problems, but just
> to be on the safe side I modified your patch to keep the original
> functionality. Please check my changes in the pending branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=8eff3667c211072a2107271139b81cbf8c7fd10a 
> 

I don't think the assignment is a problem, but I'm also fine with the
way you modified the patch.  Thanks!

regards,
dan carpenter


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
