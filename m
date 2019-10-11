Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iItLv-0000cR-LW
 for ath11k@lists.infradead.org; Fri, 11 Oct 2019 11:45:01 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [ath6kl:pending-ath11k 316/345]
 drivers/net/wireless/ath/ath11k/debug.c:575 ath11k_write_simulate_fw_crash()
 error: we previously assumed 'ar' could be null (see line 549)
References: <20191011103719.GR13286@kadam>
Date: Fri, 11 Oct 2019 14:44:54 +0300
In-Reply-To: <20191011103719.GR13286@kadam> (Dan Carpenter's message of "Fri, 
 11 Oct 2019 13:37:19 +0300")
Message-ID: <87eezjzetl.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kbuild@lists.01.org, kbuild-all@lists.01.org, ath11k@lists.infradead.org

(moving from ath10k to ath11k list)

Dan Carpenter <dan.carpenter@oracle.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending-ath11k
> head:   727f4796623292eb33ce560a3e25ba0040d17871
> commit: 75a016fcc8f79a7d650462c69bb28aa886b4f09e [316/345] ath11k: cleanup and rename ath11k_send_crash_inject_cmd()
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> New smatch warnings:
> drivers/net/wireless/ath/ath11k/debug.c:575 ath11k_write_simulate_fw_crash() error: we previously assumed 'ar' could be null (see line 549)
>
> Old smatch warnings:
> drivers/net/wireless/ath/ath11k/debug.c:566 ath11k_write_simulate_fw_crash() error: uninitialized symbol 'radioup'.
>
> # https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=75a016fcc8f79a7d650462c69bb28aa886b4f09e
> git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
> git remote update ath6kl
> git checkout 75a016fcc8f79a7d650462c69bb28aa886b4f09e
> vim +/ar +575 drivers/net/wireless/ath/ath11k/debug.c
>
> 258bbf525e652e Kalle Valo                2019-02-05  535  static ssize_t ath11k_write_simulate_fw_crash(struct file *file,
> 258bbf525e652e Kalle Valo                2019-02-05  536  					      const char __user *user_buf,
> 258bbf525e652e Kalle Valo                2019-02-05  537  					      size_t count, loff_t *ppos)
> 258bbf525e652e Kalle Valo                2019-02-05  538  {
> d25cb35c6f10ac Sathishkumar Muruganandam 2019-02-13  539  	struct ath11k_base *ab = file->private_data;
> 5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15  540  	struct ath11k_pdev *pdev;
> d25cb35c6f10ac Sathishkumar Muruganandam 2019-02-13  541  	struct ath11k *ar = ab->pdevs[0].ar;
> 258bbf525e652e Kalle Valo                2019-02-05  542  	char buf[32] = {0};
> 258bbf525e652e Kalle Valo                2019-02-05  543  	ssize_t rc;
> 5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15  544  	int i, ret, radioup;
>                                                                             ^^^^^^^
> The real bug is that this isn't initialized.
>
> 258bbf525e652e Kalle Valo                2019-02-05  545  
> 5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15  546  	for (i = 0; i < ab->num_radios; i++) {
> 5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15  547  		pdev = &ab->pdevs[i];
> 5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15  548  		ar = pdev->ar;
> 5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15 @549  		if (ar && ar->state == ATH11K_STATE_ON) {
> 5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15  550  			radioup = 1;
> 5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15  551  			break;
> 5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15  552  		}
> 5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15  553  	}
> 258bbf525e652e Kalle Valo                2019-02-05  554  	/* filter partial writes and invalid commands */
> 258bbf525e652e Kalle Valo                2019-02-05  555  	if (*ppos != 0 || count >= sizeof(buf) || count == 0)
> 258bbf525e652e Kalle Valo                2019-02-05  556  		return -EINVAL;
> 258bbf525e652e Kalle Valo                2019-02-05  557  
> 258bbf525e652e Kalle Valo                2019-02-05  558  	rc = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
> 258bbf525e652e Kalle Valo                2019-02-05  559  	if (rc < 0)
> 258bbf525e652e Kalle Valo                2019-02-05  560  		return rc;
> 258bbf525e652e Kalle Valo                2019-02-05  561  
> 258bbf525e652e Kalle Valo                2019-02-05  562  	/* drop the possible '\n' from the end */
> 258bbf525e652e Kalle Valo                2019-02-05  563  	if (buf[*ppos - 1] == '\n')
> 258bbf525e652e Kalle Valo                2019-02-05  564  		buf[*ppos - 1] = '\0';
> 258bbf525e652e Kalle Valo                2019-02-05  565  
> 5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15  566  	if (radioup == 0) {
>                                                                     ^^^^^^^^^^^^
> So this is meaningless.  Why not check if (i == ab->num_radios) instead?

Can someone from ath11k look at this report, please?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
